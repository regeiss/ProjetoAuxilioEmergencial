//
//  ProjetoAuxilioEmergencialApp.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 17/12/24.
//
import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ProjetoAuxilioEmergencialApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate

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
        }
        .modelContainer(sharedModelContainer)
    }
}
