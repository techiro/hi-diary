//
//  Note.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import Foundation

struct Note: Identifiable, NoteEntityProtocol {
    var id: String
    var title: String?
    var content: String?
    var finished: Bool
    var postedDate: Date?
    var modifyDate: Date?
    var isPublic: Bool?
    var like: String?
    var icon: String?
    var comments: String?
}
