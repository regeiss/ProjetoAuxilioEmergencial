//
//  Item.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 17/12/24.
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
