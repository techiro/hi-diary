//
//  LoginViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/12.
//

import Combine
import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: Private

    private let authProvider: AuthProviderProtocol
    @Published private var isBusy: Bool = false
    private var subscriptions = Set<AnyCancellable>()

    // MARK: Input

    @Published var userId: String = ""
    @Published var password: String = ""

    // MARK: Output

    @Published private(set) var canLogin: Bool = false
    @Published private(set) var validationText: String = ""

    // MARK: Action

    func login() -> AnyPublisher<User, Error> {
        isBusy = true
        validationText = ""

        return authProvider.login(userId: userId, password: password)
            .receive(on: RunLoop.main)
            .handleEvents(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.validationText = ""
                case .failure:
                    self?.validationText = "Incorrect ID or password"
                }

                self?.isBusy = false
            })
            .eraseToAnyPublisher()
    }

    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
        $userId
            .combineLatest($password, $isBusy)
            .map { userId, password, isBusy in
                guard userId.isEmpty == false, password.isEmpty == false, isBusy == false else { return false }

                return true
            }
            .receive(on: RunLoop.main)
            .assign(to: \.canLogin, on: self)
            .store(in: &subscriptions)
    }
}
