//
//  NotificacaoAddView.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 12/01/25.
//

import SwiftUI

struct NotificacaoEditView: View {

  enum FocusableField: Hashable {
    case titulo
  }

  enum Mode {
    case add
    case edit
  }

  @FocusState private var focusedField: FocusableField?
  @State var notificacao = Notificacao(titulo: "", texto: "", data: Date(), prioridade: 0, lido: false)
  @Environment(\.dismiss)

  private var dismiss
  var mode: Mode = .add
  let onCommit: (_ notificacao: Notificacao) -> Void

  private func commit() {
    onCommit(notificacao)
    dismiss()
  }

  private func cancel() {
    dismiss()
  }

  var body: some View {

    NavigationStack {
      Form {
        TextField("Title", text: $notificacao.titulo)
          .focused($focusedField, equals: .titulo)
      }
      .navigationTitle(mode == .add ? "New Reminder" : "Details")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(action: cancel) {
            Text("Cancel")
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button(action: commit) {
            Text("Add")
          }
          .disabled(notificacao.titulo.isEmpty)
        }
      }
      .onAppear {
        focusedField = .titulo
      }
    }
  }
}
