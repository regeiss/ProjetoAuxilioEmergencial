//
//  NotificacaoListScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 12/01/25.
//

import SwiftUI

struct NotificacaoListScreen: View {

  @StateObject private var viewModel = NotificacaoViewModel()
  @State private var isAddNotificacaoDialogPresented = false

  private func presentAddNotificacaoiew() {
    isAddNotificacaoDialogPresented.toggle()
  }

  var body: some View {
    List($viewModel.notificacoes) { $notificacao in
      NotificacaoRowView(notificacao: $notificacao)
//        .onChange(of: notificacao.lida) { newValue in
//          viewModel.setNotificacaoLida(notificacao, lida: newValue)
        // }

    }
    .toolbar {
      ToolbarItemGroup(placement: .bottomBar) {
        Button(action: presentAddNotificacaoiew) {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("New Notificacao")
          }
        }
        Spacer()
      }
    }
    .sheet(isPresented: $isAddNotificacaoDialogPresented) {
      NotificacaoEditView { notificacao in
        viewModel.addNotificacao(notificacao)
      }
    }
    .tint(.red)
  }
}
