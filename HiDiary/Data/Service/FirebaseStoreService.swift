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

final class FirebaseStoreService: ObservableObject, FireStoreProtocolProtocol {
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
    func observeNotes() -> Future<[Note], Error> {
        return Future<[Note], Error> { promise in

            #if DEBUG
            promise(.success([Note(id: "0000", title: "title", content: "content content cnotent", finished: true, postedDate: nil, modifyDate: nil)]))
            #endif
            if false {
                promise(.failure(fatalError("✋テストエラー:observeNotes")))
            }

        }
    }

    func stopObservingNotes() -> Future<Void, Error> {
        return Future<Void, Error> { promise in
            promise(.failure(fatalError("✋テストエラー:stopObservingNotes")))

        }
    }

}
