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
    var content: String?
    var finished: Bool
    var postedDate: Date?
    var modifyDate: Date?
    var isPublic: Bool

}
