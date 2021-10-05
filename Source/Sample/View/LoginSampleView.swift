//
//  LoginSampleView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/12.
//
import Combine
import SwiftUI

struct CreateUserView: View {
    @StateObject var vm = CreateUserViewModel()

    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $vm.username)
                TextField("Password", text: $vm.password)
                TextField("Password Again", text: $vm.passwordAgain)
                Button(action: {}, label: {
                    Text("Submit")
                })
                .disabled(!vm.readyToCreate)

                Section(header: Text("DEBUG")) {
                    Text(vm.readyToCreate ? "Ready to create" : "Waiting input")
                }
            }
            .navigationTitle("Create User")
        }
    }
}

class CreateUserViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    @Published var readyToCreate = false

    private var anyCancellable = Set<AnyCancellable>()

    init() {
        $username
            .combineLatest($password, $passwordAgain)
            .map {
                let username = $0.0
                let password = $0.1
                let passwordAgain = $0.2

                guard username.isEmpty == false, password.isEmpty == false else { return false }
                guard password == passwordAgain else { return false }
                return true
            }
            .assign(to: \.readyToCreate, on: self)
            .store(in: &anyCancellable)
    }
}
