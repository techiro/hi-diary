//
//  Memo.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/13.
//

import Foundation
import RealmSwift

class Memo: Object, Identifiable {
    @objc dynamic var text = ""
    @objc dynamic var postedDate = Date()
}

extension Memo {
    private static var config = Realm.Configuration(schemaVersion: 1)
    private static var realm = try! Realm(configuration: config)

    static func findAll() -> Results<Memo> {
        realm.objects(self)
    }

    static func add(_ memo: Memo) {
        try! realm.write {
            realm.add(memo)
        }
    }

    static func delete(_ memo: Memo) {
        try! realm.write {
            realm.delete(memo)
        }
    }

    static func delete(_ memos: [Memo]) {
        try! realm.write {
            realm.delete(memos)
        }
    }
}
