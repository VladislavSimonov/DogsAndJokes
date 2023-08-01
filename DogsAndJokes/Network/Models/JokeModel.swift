//
//  JokeModel.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 1.08.23.
//

import Foundation

struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
