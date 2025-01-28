//
//  PlaceholderScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 22/12/24.
//

import SwiftUI

struct PlaceholderScreen: View {

  @State private var isSettingsScreenPresented = false

  private func presentSettingsScreen() {
    isSettingsScreenPresented.toggle()
  }

  var body: some View {

    NavigationStack {
      VStack {
        Text("Tela placeholder")
      }
      .navigationTitle("Auxilio Emergencial")
      .sheet(isPresented: $isSettingsScreenPresented) {
        SettingsScreen()
      }
      .toolbar {
        ToolbarItemGroup(placement: .confirmationAction) {
          Button(action: presentSettingsScreen) {
            Image(systemName: "gearshape")
          }
        }
      }
    }
  }
}
