//
//  DogsAndJokesView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI

struct DogsAndJokesView: View {
    
    @State private var dogModel: DogModel?
        
    var body: some View {
        GeometryReader { proxy in
            URLImage(url: URL(string: dogModel?.message ?? ""))
                .cornerRadius(10)
                .padding(20)
                .frame(height: proxy.frame(in: .local).width)
                .position(CGPoint(x: proxy.frame(in: .local).midX,
                                  y: proxy.frame(in: .local).midY))
                .task {
                    do {
                        dogModel = try await NetworkManager.getDogInfo()
                    } catch let error {
                        print(error)
                    }
                }
        }
    }
}
 
#Preview {
    DogsAndJokesView()
        .modelContainer(for: Item.self, inMemory: true)
}
