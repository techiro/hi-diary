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
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    @State var isError: Bool = false
    @State var subTitle = ""

    let password = "password"
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("SwiftUI App")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail address", text: $inputEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $inputPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)
                }
                .frame(height: 200)

                Button(action: {
                           print("Login処理")
                           authService.signIn(email: inputEmail, password: inputPassword) { _, error in

                               if let error = error {
                                   subTitle = error.localizedDescription
                                   isError = true
                                   inputPassword = ""
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
                    .disabled(inputEmail.isEmpty || inputPassword.isEmpty)

                NavigationLink("アカウントをお持ちでない方はこちら >", destination: SignUpView().environmentObject(authService))

                Spacer()
            }
        }
        .popup(
            isPresented: $isError,
            type: .toast,
            position: .bottom,
            animation: .easeIn,
            autohideIn: 1.5,
            dragToDismiss: true,
            closeOnTap: true,
            closeOnTapOutside: true
        ) {
            // MARK: dismisscallback
        } view: {
            Toast(title: "ログインエラー", subTitle: subTitle, image: Image(systemName: "xmark.circle"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
