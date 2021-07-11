//
//  Session.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//

import Foundation
import Combine

final class Session: ObservableObject {
    @Published var isLogin: Bool
    @Published var user: User?
    
    init(isLogin: Bool = false, user: User? = nil) {
        self.isLogin = isLogin
        self.user = user
    }
}
