//
//  FirebaseAuthViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//
import FirebaseAuth
import Foundation

final class FirebaseAuthViewModel: ObservableObject {
    
    @Published var signedIn = false

    private let auth = Auth.auth()

    private var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    init() {
        self.signedIn = isSignedIn
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            print("signIn成功")
            // MARK: success signIn
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            print("SignUp成功")
            // MARK: success signUp
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
}
