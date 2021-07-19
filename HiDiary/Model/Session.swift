//
//  Session.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import FirebaseAuth
import Foundation

final class Session: ObservableObject {
    @Published var isLogin: Bool
    @Published var user: FirebaseAuth.User?
    var handle: AuthStateDidChangeListenerHandle?
    
    init(isLogin: Bool = false, user: User? = nil) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.isLogin = (auth.currentUser != nil) ? true : false
            self.user = user
        }
    }
    
    deinit {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
