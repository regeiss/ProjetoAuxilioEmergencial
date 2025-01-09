//
//  PessoaResponsavelModel.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 29/12/24.
//

import Foundation
import SwiftData

@Model
final class PessoaResponsavelModel {
    var id: Int
    var nome: String
    var email: String
    var telefone: String

    init(id: Int, nome: String, email: String, telefone: String) {
        self.id = id
        self.nome = nome
        self.email = email
        self.telefone = telefone
    }
}
