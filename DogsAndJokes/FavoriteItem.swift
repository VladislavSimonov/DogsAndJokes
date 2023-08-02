//
//  FavoriteItem.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import Foundation
import SwiftData

@Model
final class FavoriteItem {
    
    let dogPhotoUrlString: String
    let joke: String
    
    init(dogPhotoUrlString: String,
         joke: String)
    {
        self.dogPhotoUrlString = dogPhotoUrlString
        self.joke = joke
    }
}
