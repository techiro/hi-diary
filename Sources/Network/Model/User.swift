//
//  User.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//

import Foundation

struct User: Codable {
    var uid: String
    var email: String?
    var displayName: String?
}
