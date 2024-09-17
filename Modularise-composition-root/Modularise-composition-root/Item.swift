//
//  Item.swift
//  Modularise-composition-root
//
//  Created by groo on 16/9/24.
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
