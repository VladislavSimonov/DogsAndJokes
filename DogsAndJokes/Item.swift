//
//  Item.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
