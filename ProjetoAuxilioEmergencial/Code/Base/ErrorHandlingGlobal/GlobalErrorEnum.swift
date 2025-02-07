//
//  GlobalErrorEnum.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 02/02/25.
//

import Foundation

enum AppError: Error, Identifiable {
  case networkError(String)
  case validationError(String)
  case unknownError

  var id: String {
    switch self {
    case .networkError(let message):
      return "networkError: \(message)"
    case .validationError(let message):
      return "validationError: \(message)"
    case .unknownError:
      return "unknownError"
    }
  }

  var message: String {
    switch self {
    case .networkError(let message), .validationError(let message):
      return message
    case .unknownError:
      return "An unknown error occurred."
    }
  }
}
