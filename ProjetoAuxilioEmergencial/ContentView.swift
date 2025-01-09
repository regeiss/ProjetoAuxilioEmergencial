//
//  ContentView.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 17/12/24.
//

import SwiftUI
import SwiftData

enum TabSelection {
    case comeco1
    case home
    case about
    case library
    case settings
    case blog
    case tested
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    //  @State private var selectedTab: TabSelection = .home

    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]

    var body: some View {

        if horizontalSize == .regular {
            SplitViewScreen()
        } else {
            TabViewScreen()
        }
    }
}
