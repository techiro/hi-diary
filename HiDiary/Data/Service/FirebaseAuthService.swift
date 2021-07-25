//
//  FirebaseAuthService.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/20.
//

import FirebaseAuth
import Foundation

final class FirebaseAuthenticationService: ObservableObject {
    @Published var user: User?

    var cancellable: AuthStateDidChangeListenerHandle?

    init() {
        cancellable = Auth.auth().addStateDidChangeListener { (_, user) in
            if let user = user {
                self.user = User(
                    uid: user.uid,
                    email: user.email,
                    displayName: user.displayName
                )
            } else {

                self.user = nil
            }
        }
    }

    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut() throws {
        try Auth.auth().signOut()
        self.user = nil

        #if DEBUG
        throw FirebaseAuthError.signOutError
        #endif
    }

}
