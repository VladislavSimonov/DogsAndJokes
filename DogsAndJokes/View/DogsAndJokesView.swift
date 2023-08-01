//
//  DogsAndJokesView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI

struct DogsAndJokesView: View {
    
    @State private var dogModel: DogModel?
    @State private var jokeModel: JokeModel?
    @State private var isLike : Bool = false
        
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    getDogModel()
                }) {
                    URLImage(url: URL(string: dogModel?.message ?? ""))
                        .cornerRadius(10)
                        .frame(width: UIScreen.screenWidth - 100,
                           height: UIScreen.screenWidth - 100)
                        .padding(10)
                }.foregroundColor(.black)
                
                Button(action: {
                    isLike.toggle()
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
            .padding(20)
            .foregroundColor(.black)
            
            Button(action: {
                isLike = false
                getData()
            }) {
                Text("Regenerate")
            }
            
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
}
 
#Preview {
    DogsAndJokesView()
        .modelContainer(for: Item.self, inMemory: true)
}
