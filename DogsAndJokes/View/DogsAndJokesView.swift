//
//  DogsAndJokesView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI
import SwiftData

struct DogsAndJokesView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var dogModel: DogModel?
    @State private var jokeModel: JokeModel?
    @State private var isLike : Bool = false
        
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    getDogModel()
                }) {
                    URLImage(url: URL(string: dogModel?.message ?? ""))
                        .cornerRadius(10)
                        .frame(width: UIScreen.screenWidth -
                               (orientation == .portrait ||
                                orientation == .unknown ? 100 : 200),
                           height: UIScreen.screenWidth -
                               (orientation == .portrait ||
                                orientation == .unknown ? 100 : 200))
                        .padding(10)
                        .onRotate { newOrientation in
                            orientation = newOrientation
                        }
                }.foregroundColor(.black)
                
                Button(action: {
                    isLike.toggle()
                    addFavoriteItem()
                }) {
                    Label("", systemImage: isLike ? "heart.fill" : "heart")
                        .frame(width: 44, height: 44)
                }
            }
            
            Button(action: {
                getJokeModel()
            }) {
                Text("\(jokeModel?.setup ?? "") \n\(jokeModel?.punchline ?? "")")
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.black)            
            
            Button(action: {
                isLike = false
                getData()
            }) {
                Text("Regenerate")
            }
            .padding(10)
            
        }.onFirstAppear {
            getData()
        }
    }
    
    // MARK: Private functions
    
    private func getDogModel() {
        Task {
            do {
                dogModel = try await NetworkManager.getDogInfo()
            } catch let error {
                print(error)
            }
        }
    }
    
    private func getJokeModel() {
        Task {
            do {
                jokeModel = try await NetworkManager.getJoke()
            } catch let error {
                print(error)
            }
        }
    }
    
    private func getData() {
        getDogModel()
        getJokeModel()
    }
    
    private func addFavoriteItem() {
        guard let dogModel = dogModel,
              let jokeModel = jokeModel else { return }
        
        let newItem = FavoriteItem(
            dogPhotoUrlString: dogModel.message,
            joke: "\(jokeModel.setup) \n\(jokeModel.punchline)"
        )
        modelContext.insert(newItem)
    }
}
 
#Preview {
    DogsAndJokesView()
        .modelContainer(for: FavoriteItem.self, inMemory: true)
}
