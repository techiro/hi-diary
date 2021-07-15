//
//  LoginViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//

import Combine
import Foundation
final class HomeViewModel: ObservableObject {
    // MARK: Private
    private let authProvider: AuthProviderProtocol
   
    // MARK: Output
    @Published private(set) var canLogin: Bool = true
    @Published private(set) var memos: [Memo] = Array(Memo.findAll())
    
    // MARK: Action
    func logout() -> AnyPublisher<Void, Error> {
        canLogin = false
        
        return authProvider.logout()
            .receive(on: RunLoop.main)
            .handleEvents(receiveCompletion: { [weak self] completion in
                self?.canLogin = true
            })
            .eraseToAnyPublisher()
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
    }
}
