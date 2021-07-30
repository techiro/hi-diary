//
//  Note.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import FirebaseFirestoreSwift
import Foundation

struct Note: Identifiable, Codable, NoteEntityProtocol {

    @DocumentID var id: String?
    var like: String?
    var icon: String?
    var content: String?
    var postedDate: Date?
    var modifyDate: Date?
    var finished: Bool
    var isPublic: Bool
    var comments: String?

}
