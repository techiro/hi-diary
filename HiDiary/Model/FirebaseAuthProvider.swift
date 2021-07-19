//
//  FirebaseAuthProvider.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//
import Combine
import FirebaseAuth
import Foundation

enum FirebaseAuthError: Error {
    case invalidIdOrPassword
}

protocol FirebaseAuthProviderProtocol {
    func logIn(email: String, password: String) -> Future<User, Error>
    func logOut() -> Future<Void, Error>
    func signUp(email: String, password: String) -> Future<User, Error>
    
    //TODO: Googleログイン
    //func googleSignIn() -> Future<User, Error>
    //func googleSignOut() -> Future<Void, Error>
}

final class FirebaseAuthProvider: FirebaseAuthProviderProtocol {
    func signUp(email: String, password: String) -> Future<User, Error> {
        <#code#>
    }
    
    
    private let auth = Auth.auth()
    
    func logIn(email: String, password: String) -> Future<User, Error> {
        let signIn = auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
        }
    }
    
    func logOut() -> Future<Void, Error> {
        <#code#>
    }
    
//    func signUp(email: String, password: String) -> Future<User, Error> {
//        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            print("SignUp成功")
//            // MARK: success signUp
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
//        })
//    }
    
    
    func logIn(userId: String, password: String) -> Future<User, Error> {
        
        return Future<User, Error> { promise in
            // This closure is unexpectedly called synchronously.
            // Therefore, wrap it with DispatchQueue.global().async
            DispatchQueue.global().async {
                // Intended to network communicate
                Thread.sleep(forTimeInterval: 1.0)
                 if userId == "A" && password == "A" {
                     promise(.success(User(id: userId, name: "foobar")))
                 } else {
                     promise(.failure(AuthError.invalidIdOrPassword))
                 }
            }
        }
    }
    
    func logout() -> Future<Void, Error> {
        // This closure is unexpectedly called synchronously.
        // Therefore, wrap it with DispatchQueue.global().async
        return Future<Void, Error> { promise in
            DispatchQueue.global().async {
                // Intended to network communicate
                Thread.sleep(forTimeInterval: 1.0)
                
                promise(.success(()))
            }
        }
    }
}
