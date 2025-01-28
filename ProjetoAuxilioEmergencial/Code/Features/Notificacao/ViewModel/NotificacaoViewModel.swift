//
//  NotificacaoViewModel.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 09/01/25.
//

import Foundation
import Combine
import Factory

class NotificacaoViewModel: ObservableObject {

  @Published var notificacoes = [Notificacao]()
  @Published var errorMessage: String?
  @Injected(\.notificacoesRepository)

  private var notificacoesRepository: NotificacaoRepository

  init() {
    notificacoesRepository
      .$notificacoes
      .assign(to: &$notificacoes)
  }

  func addNotificacao(_ notificacao: Notificacao) {
    do {
      try notificacoesRepository.addNotificacao(notificacao)
      errorMessage = nil
    }
    catch {
      print(error)
      errorMessage = error.localizedDescription
    }
  }

  func updateNotificacao(_ notificacao: Notificacao) {
    do {
      try notificacoesRepository.updateNotificacao(notificacao)
      errorMessage = nil
    }
    catch {
      print(error)
      errorMessage = error.localizedDescription
    }
  }

  func setNotificacaoLida(_ notificacao: Notificacao, lida: Bool) {
    var notificacaoEditada = notificacao
    notificacaoEditada.lido = lida
    updateNotificacao(notificacaoEditada)
  }
}
