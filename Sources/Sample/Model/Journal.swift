//
//  Journal.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/08.
//

import Foundation
import RealmSwift

class Journal: Object, Identifiable {
    @objc dynamic var text = ""
    @objc dynamic var postedDate = Date()
}

extension Journal {
    private static var config = Realm.Configuration(schemaVersion: 1)
    private static var realm = try! Realm(configuration: config)

    static func findAll() -> Results<Journal> {
        realm.objects(self)
    }

    static func add(_ memo: Journal) {
        try! realm.write {
            realm.add(memo)
        }
    }

    static func delete(_ memo: Journal) {
        try! realm.write {
            realm.delete(memo)
        }
    }

    static func delete(_ memos: [Journal]) {
        try! realm.write {
            realm.delete(memos)
        }
    }
}
