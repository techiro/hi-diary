//
//  SampleNote.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/28.
//

import Foundation

struct SampleNote: Identifiable, NoteEntityProtocol {
    var like: String?
    var icon: String?
    var comments: String?
    var id: String?
    var content: String?
    var finished: Bool
    var postedDate: Date?
    var modifyDate: Date?
    var isPublic: Bool

    init() {
        like = "3"
        icon = "user_icon"
        id = "JLKJLGJklf2390KLJ"
        content = "I'm man. Today,I went shopping to Tenjin. I bought a cap."
        finished = true
        postedDate = Date()
        modifyDate = nil
        isPublic = true

    }
}
