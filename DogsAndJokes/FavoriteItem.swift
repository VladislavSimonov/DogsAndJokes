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
    let dogModel: DogModel
    let jokeModel: JokeModel
    
    init(dogModel: DogModel,
         jokeModel: JokeModel)
    {
        self.dogModel = dogModel
        self.jokeModel = jokeModel
    }
}
