//
//  TabViewScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 05/01/25.
//

import SwiftUI

struct TabViewScreen: View {
    var body: some View {
        TabView {
            Tab("Main", systemImage: "house") {
                PlaceholderScreen()
            }

            TabSection("Blog") {
                Tab("All topics", systemImage: "pencil") {
                    PlaceholderScreen()
                }

                Tab("SwiftUI", systemImage: "swift") {
                    Text("SwiftUI topic")
                }

                Tab("Concurrency", systemImage: "timelapse") {
                    Text("Concurrency topic")
                }

                Tab("Ajustes", systemImage: "gear") {
                    SettingsScreen()
                }
            }

            Tab("Blog", systemImage: "pencil") {
                Text("This is the blog page")
            }
            // repeat for other sections...
        }.tabViewStyle(.sidebarAdaptable)
    }
}
