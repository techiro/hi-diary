//
//  FIrebaseAuthError.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/24.
//

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

public enum FirestoreCollectionReference: String {
    case users
    case posts
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
