//
//  FirebaseAuthViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//
import FirebaseAuth
import Foundation

enum FirebaseAuthError: Error {
    /// ハンドルエラー
    case handleError
    /// サインインエラー
    case signInError
    /// サインアップエラー
    case signUpError
    // サインアウトエラー
    case signOutError
    
}

extension FirebaseAuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .handleError:
            return NSLocalizedString("Firebase handling Error", comment: "")
        case .signInError:
            return NSLocalizedString("Firebase signIn Error", comment: "")
        case .signUpError:
            return NSLocalizedString("Firebase signUp Error", comment: "")
        case .signOutError:
           return NSLocalizedString("Firebase signOut Error", comment: "")
        }
    }
}

final class FirebaseAuthViewModel: ObservableObject {

    private let auth = Auth.auth()
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                if error == nil { print("errorなし") }
                return print("error")
            }
            print("signIn成功")
            // MARK: success signIn
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: { result, error in
            guard result != nil, error == nil else {
                if error == nil { print("errorなし") }
                return print("error")
            }
            print("SignUp成功")
            // MARK: success signUp
        })
    }
    
    func signOut() throws {
        do {
          try auth.signOut()
        } catch let signOutError as NSError {
          throw signOutError
        }
    }
}
