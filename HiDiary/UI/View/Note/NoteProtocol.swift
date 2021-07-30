//
//  NoteProtocol.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/30.
//

import Foundation

protocol NoteEntityProtocol {
    var id: String? { get set }
    var content: String? { get set }
    var finished: Bool { get set }
    var postedDate: Date? { get set }
    var modifyDate: Date? { get set }
    var isPublic: Bool { get set }
    var like: String? { get set }
    var icon: String? { get set }
    var comments: String? { get set }
}
