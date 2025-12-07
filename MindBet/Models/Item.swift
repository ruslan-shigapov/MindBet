//
//  Item.swift
//  MindBet
//
//  Created by Ruslan Shigapov on 04.12.2025.
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
