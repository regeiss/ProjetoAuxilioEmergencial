//
//  HomeModel.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 20/08/24.
//

import Foundation
import SwiftData

@Model
class HomeModel {
    @Attribute(.unique) var id: Int
    @Attribute var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
