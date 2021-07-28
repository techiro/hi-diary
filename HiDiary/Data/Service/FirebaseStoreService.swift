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
    func observeNotes() -> Future<[Note], Error>
    func stopObservingNotes() -> Future<Void, Error>
}

final class FirebaseStoreService: ObservableObject {
    let db = Firestore.firestore()
    var ref: DocumentReference?
    @Published var posts = [Note]()

    func saveNotes(user: User, data: Note, handler: @escaping (Error?) -> Void) {

        do {
            let encoder = JSONEncoder()
            let json = try encoder.encode(data)
            ref = db.collection("users").document(user.uid).collection("history").addDocument(data: [
                "id": data.id,
                "timestamp": data.postedDate!,
                "content": data.content!,
                "isPublic": data.isPublic
            ]) { error in
                handler(error)
            }
        } catch {
            print("Error when trying to encode book: \(error)")
        }

    }

    func addNote(note: Note, handler: @escaping (Error?) -> Void) {
        let collectionRef = db.collection(FirestoreCollectionReference.posts.rawValue)
        do {
            let newDocReference = try collectionRef.addDocument(from: note)
            print("Book stored with new document reference: \(newDocReference)")
        } catch {
            handler(error)
        }
    }

    func postNotes(user: User, data: Note, handler: @escaping (Error?) -> Void) {

        ref = db.collection("posts").addDocument(data: [
            "id": data.id,
            "auther": user.uid,
            "timestamp": data.postedDate!,
            "content": data.content!,
            "isPublic": data.isPublic
        ]) { error in
            handler(error)
        }
    }

    // ユーザー情報を取得
    func getUsersPosts(userID: String) {
        db.collection("users")
            .whereField("author",
                        isEqualTo: db.collection("users").document("mono"))
            .getDocuments { (snapshot, error) in
                snapshot!.documents.forEach { doc in
                    print(doc)
                }
            }
    }

    // フィードの情報を取得
    func getPublicPosts() {
        db.collection("posts")
            .whereField("isPublic", in: [true])
            .getDocuments { (snapshot, error) in
                snapshot!.documents.forEach { doc in
                    print(doc)
                    print(doc.data())
                }
            }
    }

    // フィードの情報を取得
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
                    case .success(let note):
                        if let note = note {
                            self.posts.append(note)
                        } else {
                            handler(fatalError("DocumentSnapshot was nil."))
                        }
                    case .failure(let error):
                        // A Book value could not be initialized from the DocumentSnapshot.
                        switch error {
                        case DecodingError.typeMismatch(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.valueNotFound(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.keyNotFound(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.dataCorrupted(let key):
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
