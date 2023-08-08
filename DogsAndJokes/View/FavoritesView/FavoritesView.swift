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
        NavigationView {
            List {
                ForEach(favoriteItems) { item in
                    FavoritesListView(favoriteItem: item)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(favoriteItems[index])
                    }
                })
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: FavoriteItem.self, inMemory: true)
}
