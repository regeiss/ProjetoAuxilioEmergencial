//
//  SettingsScreen.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 14/07/24.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    @AppStorage("contextSet") private var contextSet: Bool = false
    @AppStorage("modoEscuro") private var modoEscuro: Bool = false
    @AppStorage("backup") private var backup: Bool = false
    @AppStorage("alertas") private var alertas: Bool = false
    @StateObject var viewModel = SettingsViewModel()
    @State var isShowSignUpDialogPresented = false

    var body: some View {
//        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section {
                        Toggle(isOn: $backup) {
                            Text("Backup")
                        }
                        Toggle(isOn: $alertas) {
                            Text("Alertas")
                        }
                        Toggle(isOn: $modoEscuro) {
                            Text("Modo escuro")
                        }
                    }
                    Section {
                        Button(action: {needsAppOnboarding = true},
                               label: {
                            Text("Resetar Onboarding")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .font(Font.title2.bold().lowercaseSmallCaps())
                        })
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .scrollContentBackground(.hidden)
                #if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
                .navigationBarTitle("Ajustes", displayMode: .automatic)
                .toolbar(content: {
                    ToolbarItem {
                        Button { dismiss()}
                        label: { Label("Dismiss", systemImage: "xmark.circle.fill")}
                    }

                })
                #endif
                Spacer()
            }
       // }
    }
}
