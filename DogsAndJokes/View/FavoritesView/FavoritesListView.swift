//
//  FavoritesListView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 1.08.23.
//

import SwiftUI
import SwiftData

struct FavoritesListView: View {
    
    private var favoriteItem: FavoriteItem?
    
    init(favoriteItem: FavoriteItem?) {
        self.favoriteItem = favoriteItem
    }
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: favoriteItem?.dogPhotoUrlString ?? ""))
                .cornerRadius(10)
                .frame(width: 100, height: 75)
            
            VStack(alignment: .leading, content: {
                Text("\(favoriteItem?.joke ?? "")")
                    .padding(10)
            })
        }
    }
}

#Preview {
    FavoritesListView(favoriteItem: nil)
        .modelContainer(for: FavoriteItem.self, inMemory: true)
}
