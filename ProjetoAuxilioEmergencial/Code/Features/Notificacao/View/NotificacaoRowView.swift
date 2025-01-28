//
//  NotificacaoRowView.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 12/01/25.
//

import SwiftUI

struct NotificacaoRowView: View {
  @Binding var notificacao: Notificacao

  var body: some View {
    HStack {
      Toggle(isOn: $notificacao.lido) { /* no label, on purpose */}
        .toggleStyle(.notificacao)
      Text(notificacao.titulo)
    }
  }
}
