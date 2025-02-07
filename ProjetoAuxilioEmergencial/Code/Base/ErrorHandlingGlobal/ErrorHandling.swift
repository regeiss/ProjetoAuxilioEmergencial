//
//  ErrorHandling.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 02/02/25.
//

import Foundation
import SwiftUI

class ErrorHandling: ObservableObject {
  @Published var currentError: AppError?

  func handle(error: Error) {
    if let appError = error as? AppError {
      currentError = appError
    } else {
      currentError = .unknownError
    }
  }
}

struct ErrorView: View {
  @EnvironmentObject private var errorHandling: ErrorHandling

  var body: some View {
    if let error = errorHandling.currentError {
      Text(error.message)
        .foregroundColor(.red)
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(8)
        .onTapGesture {
          errorHandling.currentError = nil
        }
    }
  }
}
