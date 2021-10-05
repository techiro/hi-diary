//
//  FirebaseStoreService.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

protocol FireStoreProtocolProtocol {
    func getPosts() -> AnyPublisher<[Note], Error>
    func stopObservingNotes() -> Future<Void, Error>
}

final class FirebaseStoreService: ObservableObject {
    let db = Firestore.firestore()
    var ref: DocumentReference?

    @Published var posts = [Note]()
    @Published var showingAlert = false

    // MARK: ノートの保存

    func addNote(note: Note, handler: @escaping (Error?) -> Void) {
        let collectionRef = db.collection(FirestoreCollectionReference.posts.rawValue)
        do {
            let newDocReference = try collectionRef.addDocument(from: note)
            print("Book stored with new document reference: \(newDocReference)")
        } catch {
            handler(error)
        }
    }

    // MARK: 公開投稿情報を取得

    func getCodablePosts(handler: @escaping (Error?) -> Void) {
        let docRef = db.collection("posts")
            .whereField("isPublic", in: [true])

        docRef.getDocuments { snapshot, error in
            if let error = error {
                handler(error)
            } else {
                snapshot?.documents.forEach { document in

                    let result = Result { try document.data(as: Note.self) }
                    switch result {
                    case let .success(note):
                        if let note = note {
                            self.posts.append(note)
                        }

                    case let .failure(error):
                        // A Book value could not be initialized from the DocumentSnapshot.
                        switch error {
                        case let DecodingError.typeMismatch(_, context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case let DecodingError.valueNotFound(_, context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case let DecodingError.keyNotFound(_, context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case let DecodingError.dataCorrupted(key):
                            print("\(error.localizedDescription): \(key)")
                        default:
                            print("Error decoding document: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}
