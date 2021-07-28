//
//  FirebaseStoreService.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import Combine
import FirebaseFirestore
import Foundation

protocol FireStoreProtocolProtocol {
    func observeNotes() -> Future<[Note], Error>
    func stopObservingNotes() -> Future<Void, Error>
}

final class FirebaseStoreService: ObservableObject {
    let db = Firestore.firestore()
    var ref: DocumentReference?

    func saveNotes(user: User, data: Note, handler: @escaping (Error?) -> Void) {

        ref = db.collection("users").document(user.uid).collection("history").addDocument(data: [
            "id": data.id,
            "timestamp": data.postedDate!,
            "content": data.content!,
            "isPublic": data.isPublic!
        ]) { error in
            handler(error)
        }
    }

    func postNotes(user: User, data: Note, handler: @escaping (Error?) -> Void) {

        ref = db.collection("posts").addDocument(data: [
            "id": data.id,
            "timestamp": data.postedDate!,
            "content": data.content!,
            "isPublic": data.isPublic!
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
            .getDocuments { (snapshot, error) in
                snapshot!.documents.forEach { doc in
                    print(doc)
                }
            }
    }

}
