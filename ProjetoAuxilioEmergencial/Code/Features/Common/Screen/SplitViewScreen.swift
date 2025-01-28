//
//  SplitViewScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 05/01/25.
//

import SwiftUI

struct SplitViewScreen: View {

  @State private var visibility: NavigationSplitViewVisibility = .all
  @State private var selectedFolder: String?
  @State private var selectedItem: String?

  @State private var folders = [
    "All": [
      "Item1",
      "Item2"
    ],
    "Favorites": [
      "Item2"
    ]
  ]

  var body: some View {

    NavigationSplitView(columnVisibility: $visibility) {
      List(selection: $selectedFolder) {
        ForEach(Array(folders.keys.sorted()), id: \.self) { folder in
          NavigationLink(value: folder) {
            Text(verbatim: folder)
          }
        }
      }
      .navigationTitle("Sidebar")
    } content: {
      if let selectedFolder {
        List(selection: $selectedItem) {
          ForEach(folders[selectedFolder, default: []], id: \.self) { item in
            NavigationLink(value: item) {
              Text(verbatim: item)
            }
          }
        }
        .navigationTitle(selectedFolder)
      } else {
        Text("Choose a folder from the sidebar")
      }
    } detail: {
      NavigationStack {
        ZStack {
          if let selectedItem {
            NavigationLink(value: selectedItem) {
              Text(verbatim: selectedItem)
                .navigationTitle(selectedItem)
                .toolbar {
                  Button("Focus") {
                    visibility = .detailOnly
                  }
                }
            }
          } else {
            Text("Choose an item from the content")
          }
        }
        .navigationDestination(for: String.self) { text in
          Text(verbatim: text)
        }
      }
    }
  }
}
