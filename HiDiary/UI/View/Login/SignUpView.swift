//
//  SignUp.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authService: FirebaseAuthenticationService
    @State var inputEmail = ""
    @State var inputPassword = ""
    @State var isError: Bool = false
    @State var subTitle = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("SignUp")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail Address", text: $inputEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $inputPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                    print("SignUp処理")
                    authService.signUp(email: inputEmail, password: inputPassword) { result, error in

                        if let error = error {
                            subTitle = error.localizedDescription
                            isError = true
                            inputPassword = ""
                            print(error)
                        }
                    }

                },
                label: {
                    Text("Create Account")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })
                .disabled(inputPassword.isEmpty || inputEmail.isEmpty)

                Spacer()
            }
        }
        .popup(isPresented: $isError, type: .toast, position: .bottom, animation: .easeIn, autohideIn: 1.5, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {

        } view: {
            Toast(title: "アカウント新規作成エラー", subTitle: subTitle, image: Image(systemName: "xmark.circle"))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
