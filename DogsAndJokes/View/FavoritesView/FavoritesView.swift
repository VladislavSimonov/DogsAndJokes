//
//  FavoritesView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteItems: [FavoriteItem]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(favoriteItems) { item in
                    FavoritesListView(favoriteItem: item)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: FavoriteItem.self, inMemory: true)
}
