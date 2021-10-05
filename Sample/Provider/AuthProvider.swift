//
//  AuthProvider.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import Foundation

enum AuthError: Error {
    case invalidIdOrPassword
}

protocol AuthProviderProtocol {
    func login(userId: String, password: String) -> Future<User, Error>
    func logout() -> Future<Void, Error>
}

final class AuthProvider: AuthProviderProtocol {
    func login(userId: String, password: String) -> Future<User, Error> {
        return Future<User, Error> { promise in
            // This closure is unexpectedly called synchronously.
            // Therefore, wrap it with DispatchQueue.global().async
            DispatchQueue.global().async {
                // Intended to network communicate
                Thread.sleep(forTimeInterval: 1.0)
                if userId == "A", password == "A" {
                    promise(.success(User(uid: "uid", email: "email", displayName: "sample")))
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
