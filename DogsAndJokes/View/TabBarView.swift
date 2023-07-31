//
//  TabBarView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            DogsAndJokesView()
                .tabItem {
                    Label("Dog and joke", systemImage: "dog")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    TabBarView()
        .modelContainer(for: Item.self, inMemory: true)
}
