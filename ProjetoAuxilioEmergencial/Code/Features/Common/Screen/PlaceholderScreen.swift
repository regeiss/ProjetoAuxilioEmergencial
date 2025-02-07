//
//  PlaceholderScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 22/12/24.
//

import SwiftUI
import FirebaseCrashlytics

struct PlaceholderScreen: View {

  @State private var isSettingsScreenPresented = false
  @EnvironmentObject private var errorHandling: ErrorHandling

  private func presentSettingsScreen() {
    isSettingsScreenPresented.toggle()
  }

  var body: some View {

    NavigationStack {
      VStack {
        Text("Tela placeholder")
        Button("Simulate Network Error") {
          do {
            try simulateNetworkRequest()
          } catch {
            errorHandling.handle(error: error)
          }
        }
      }
      .navigationTitle("Auxilio Emergencial")
      .sheet(isPresented: $isSettingsScreenPresented) {
        UserProfileView()
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

  func simulateNetworkRequest() throws {

    fatalError("Crash was triggered")

    //    Crashlytics.crashlytics().record(error: AppError.networkError)
    //    throw AppError.networkError("Failed to connect to the server.")
  }
}
