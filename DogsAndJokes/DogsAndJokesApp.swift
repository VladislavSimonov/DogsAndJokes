//
//  DogsAndJokesApp.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import SwiftUI
import SwiftData

@main
struct DogsAndJokesApp: App {

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(for: FavoriteItem.self)
    }
}
