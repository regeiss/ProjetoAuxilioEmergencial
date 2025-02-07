//
//  ProjetoAuxilioEmergencialApp.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 17/12/24.
//
import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import Factory

class AppDelegate: NSObject, UIApplicationDelegate {

  @LazyInjected(\.authenticationService)
  private var authenticationService

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    authenticationService.signInAnonymously()
    return true
  }
}

@main
struct ProjetoAuxilioEmergencialApp: App {

  @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
  @StateObject private var errorHandling = ErrorHandling()

  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      HomeModel.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {

    WindowGroup {
      ContentView()
        .modifier(DarkModeViewModifier())
        .environmentObject(errorHandling)
        .alert(item: $errorHandling.currentError) { error in
          Alert(
            title: Text("Error"),
            message: Text(error.message),
            dismissButton: .default(Text("OK"))
          )
        }
    }
    .modelContainer(sharedModelContainer)
  }
}
