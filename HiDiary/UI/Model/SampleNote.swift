//
//  SampleNote.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/28.
//

import Foundation

struct SampleNote: Identifiable, NoteEntityProtocol {
    var id: String?
    var content: String?
    var finished: Bool
    var postedDate: Date?
    var modifyDate: Date?
    var isPublic: Bool

    init() {
        id = "JLKJLGJklf2390KLJ"
        content = "content"
        finished = true
        postedDate = Date()
        modifyDate = nil
        isPublic = true
    }
}
