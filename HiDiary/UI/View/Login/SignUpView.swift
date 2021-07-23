//
//  SignUp.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var vm = FirebaseAuthViewModel()
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("SignUp")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                    print("SignUp処理")
                    vm.signUp(email: email, password: password)

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
                .disabled(password.isEmpty || email.isEmpty)

                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
