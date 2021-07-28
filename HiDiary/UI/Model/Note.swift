//
//  Note.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import Foundation

struct Note: Identifiable, NoteEntityProtocol {
    var id: String = UUID().uuidString
    var content: String?
    var finished: EditState = .draft
    var postedDate: Date?
    var modifyDate: Date?
    var isPublic: Bool?
}

enum EditState {
    case finish
    case draft

    var isFinish: Bool {
        switch self {
        case .finish:
            return true
        case .draft:
            return false
        }
    }

}
