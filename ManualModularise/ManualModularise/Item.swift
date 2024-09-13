//
//  Item.swift
//  ManualModularise
//
//  Created by groo on 2/9/24.
//

import Foundation
import SwiftData

//import Entities

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
