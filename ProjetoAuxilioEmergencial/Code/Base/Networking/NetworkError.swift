//
//  NetworkError.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 16/06/24.
//

import Foundation
import Factory

enum NetworkError: Error {
    case badURL
    case requestFailed(Error)
    case invalidResponse
    case dataNotFound
    case decodingFailed(Error)
    case encodingFailed(Error)
    case notFound
    case internalServerError
    case unknownError(statusCode: Int)
}

 struct DecodingErrorNetwork: Error {
    let message: String
}
