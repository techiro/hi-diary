//
//  LoginView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import FirebaseAuth
import PopupView
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: FirebaseAuthenticationService

    @ObservedObject var vm: LoginViewModel

    let password = "password"
    var body: some View {
        NavigationView {

            VStack(alignment: .center) {
                Text("SwiftUI App")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail address", text: $vm.state.inputEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $vm.state.inputPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                    print("Login処理")
                    authService.signIn(email: vm.state.inputEmail, password: vm.state.inputPassword) { result, error in

                        if let error = error {
                            vm.state.subTitle = error.localizedDescription
                            vm.state.isError = true
                            vm.state.inputPassword = ""
                            print(error)
                        }

                    }

                },
                label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })
                .disabled(!vm.isValidInput())

                NavigationLink("アカウントをお持ちでない方はこちら >", destination: SignUpView().environmentObject(authService))

                Spacer()

            }
        }
        .popup(
            isPresented: $vm.state.isError,
            type: .toast,
            position: .bottom,
            animation: .easeIn,
            autohideIn: 1.5,
            dragToDismiss: true,
            closeOnTap: true,
            closeOnTapOutside: true) {
            // MARK: dismisscallback
            } view: {
            Toast(title: "ログインエラー", subTitle: vm.state.subTitle, image: Image(systemName: "xmark.circle"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(vm: LoginViewModel())
    }
}

final class LoginViewModel: ObservableObject {

    @Published var state = State()

    func isValidInput() -> Bool {

        if state.inputPassword.count <= 7 {
            return false
        }
        if !state.inputEmail.contains("@") {
            return false
        }

        let numString = state.inputPassword.components(separatedBy: CharacterSet.decimalDigits.inverted).joined().count
        print(numString)
        let capitalString = state.inputPassword.components(separatedBy: CharacterSet.uppercaseLetters.inverted).joined().count
        print(capitalString)
        if  numString < 1 || capitalString < 1 {
            return false
        }

        if state.inputEmail.isEmpty || state.inputPassword.isEmpty {
            return false
        }

        return true
    }

    struct State {
        var inputEmail: String = ""
        var inputPassword: String = ""
        var isError: Bool = false
        var subTitle = ""
    }

}
