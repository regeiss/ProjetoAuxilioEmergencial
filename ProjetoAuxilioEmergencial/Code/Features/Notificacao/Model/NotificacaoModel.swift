//
//  NotificacaoModel.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 08/01/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

struct Notificacao: Identifiable, Codable
{
    @DocumentID var id: String?
    var nome: String
    var ativo: Bool = true
    var userId: String?
}

extension Notificacao
{
    static let collectionName = "abrigo"
}

extension Notificacao
{
  static let samples = [
    Notificacao(id: "1", nome: "********", ativo: true),
    Notificacao(id: "2", nome: "************", ativo: false),
    Notificacao(id: "3", nome: "**", ativo: true),
    Notificacao(id: "4", nome: "********************", ativo: true)
  ]
}
