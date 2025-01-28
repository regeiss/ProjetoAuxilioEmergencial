//
//  NotificacaoRepository.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 08/01/25.
//

import Foundation
import FirebaseFirestore
import Factory

public class NotificacaoRepository: ObservableObject {

  @Injected(\.firestore) var firestore
  @Published var notificacoes = [Notificacao]()
  private var listenerRegistration: ListenerRegistration?

  init() {
    subscribe()
  }

  deinit {
    unsubscribe()
  }

  func subscribe() {
    if listenerRegistration == nil {
      let query = Firestore.firestore().collection(Notificacao.collectionName)

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

  private func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }

  func addNotificacao(_ notificacao: Notificacao) throws {
    try firestore
      .collection(Notificacao.collectionName)
      .addDocument(from: notificacao)
  }

  func updateNotificacao(_ notificacao: Notificacao) throws {
    guard let documentId = notificacao.id else {
      fatalError("Reminder \(notificacao.titulo) has no document ID.")
    }

    try firestore
      .collection(Notificacao.collectionName)
      .document(documentId)
      .setData(from: notificacao, merge: true)
  }

  func removeReminder(_ notificacao: Notificacao) {
      guard let documentId = notificacao.id else {
        fatalError("Notificacao \(notificacao.titulo) has no document ID.")
      }
      firestore
        .collection(Notificacao.collectionName)
        .document(documentId)
        .delete()
    }
}
