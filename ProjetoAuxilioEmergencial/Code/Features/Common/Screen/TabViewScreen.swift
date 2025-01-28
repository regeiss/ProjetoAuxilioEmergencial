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
      Tab("Home", systemImage: "house") {
        PlaceholderScreen()
      }
      Tab("Cadastros", systemImage: "person.crop.square.on.square.angled") {
        NotificacaoListScreen()
      }

      Tab("Abrigos", systemImage: "house") {
        Text("SwiftUI topic")
      }

      Tab("Localizacao", systemImage: "map") {
        LocalizacaoAtualScreen()
      }

      Tab("Perfil", systemImage: "person") {
        SettingsScreen()
      }
    }
  }
}
