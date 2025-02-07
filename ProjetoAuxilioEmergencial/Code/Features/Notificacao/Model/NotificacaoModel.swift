//
//  NotificacaoModel.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 08/01/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

struct Notificacao: Identifiable, Codable {
  @DocumentID var id: String?
  var titulo: String
  var texto: String
  var data: Date
  var prioridade: Int
  var lido: Bool = false
  var userId: String?
}

extension Notificacao {
  static let collectionName = "notificacao"
}
