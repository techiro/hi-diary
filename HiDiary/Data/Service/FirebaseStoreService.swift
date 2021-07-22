//
//  FirebaseStoreService.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import Combine
import Foundation

protocol FireStoreProtocolProtocol {
    func observeNotes() -> Future<[Note], Error>
    func stopObservingNotes() -> Future<Void, Error>
}

final class FireStoreService: ObservableObject, FireStoreProtocolProtocol {
    
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
    
    @Published var notes = [Note]()
    
    init() {
        notes = [Note]()
    }
}
