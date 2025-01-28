//
//  NotificacaoRepository+Injection.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 22/01/25.
//

import Foundation
import Factory

extension Container {
  public var notificacoesRepository: Factory<NotificacaoRepository> {
    self {
      NotificacaoRepository()
    }.singleton
  }

}
