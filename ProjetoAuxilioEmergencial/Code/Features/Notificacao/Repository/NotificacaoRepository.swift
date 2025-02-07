//
//  NotificacaoRepository.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 08/01/25.
//

import Foundation
import Factory
import Combine
import FirebaseFirestore
import FirebaseAuth

public class NotificacaoRepository: ObservableObject {

  @Injected(\.firestore) var firestore
  @Injected(\.authenticationService) var authenticationService
  @Published var notificacoes = [Notificacao]()
  @Published var user: User?
  private var cancelables = Set<AnyCancellable>()
  private var listenerRegistration: ListenerRegistration?

  init() {
    authenticationService.$user
      .assign(to: &$user)

    $user.sink { user in
      self.unsubscribe()
      self.subscribe(user: user)
    }
    .store(in: &cancelables)
  }

  deinit {
    unsubscribe()
  }

  func subscribe(user: User? = nil) {
    if listenerRegistration == nil {
      if let localUser = user ?? self.user {
        let query = Firestore.firestore().collection(Notificacao.collectionName)
          .whereField("userId", isEqualTo: localUser.uid)

        listenerRegistration = query
          .addSnapshotListener { [weak self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
              print("No documents")
              return
            }

            print("Mapping \(documents.count) documents")
            self?.notificacoes = documents.compactMap { queryDocumentSnapshot in
              do {
                return try queryDocumentSnapshot.data(as: Notificacao.self)
              }
              catch {
                print("Error while trying to map document \(queryDocumentSnapshot.documentID): \(error.localizedDescription)")
                return nil
              }
            }
          }
      }
    }
  }

  private func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }

  func add(_ notificacao: Notificacao) throws {
    try firestore
      .collection(Notificacao.collectionName)
      .addDocument(from: notificacao)
  }

  func update(_ notificacao: Notificacao) throws {
    guard let documentId = notificacao.id else {
      fatalError("Reminder \(notificacao.titulo) has no document ID.")
    }

    try firestore
      .collection(Notificacao.collectionName)
      .document(documentId)
      .setData(from: notificacao, merge: true)
  }

  func delete(_ notificacao: Notificacao) {
    guard let documentId = notificacao.id else {
      fatalError("Notificacao \(notificacao.titulo) has no document ID.")
    }
    firestore
      .collection(Notificacao.collectionName)
      .document(documentId)
      .delete()
  }
}
