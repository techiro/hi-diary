//
//  Session.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import FirebaseAuth
import Foundation

final class Session: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var user: FirebaseAuth.User?
    var handle: AuthStateDidChangeListenerHandle?

    init(isLogin: Bool = false, user: User? = nil) {
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in

            DispatchQueue.main.async {
                self?.isLogin = (auth.currentUser != nil) ? true : false
                self?.user = user
            }
        }
    }

    deinit {
        if let handle = self.handle {
            Auth.auth().removeStateDidChangeListener(handle)
        } else {
            print(FirebaseAuthError.handleError)
        }
    }
}
