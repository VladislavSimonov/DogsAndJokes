//
//  FavoritesView.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Empty")
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: Item.self, inMemory: true)
}
