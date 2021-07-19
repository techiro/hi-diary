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
    @EnvironmentObject var session: Session
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    @State var isError: Bool = false
    @State var subscriptions = Set<AnyCancellable>()
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
                    
                    Auth.auth().signIn(withEmail: inputEmail, password: inputPassword) { result, error in
                        if let error = error {
                            print(error.localizedDescription)
                            isError = true
                        } else {
                            print(result.debugDescription)
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
                Spacer()
                
            }
            .popup(isPresented: $isError, type: .toast, position: .bottom, animation: .easeIn, autohideIn: 1, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {
                self.inputPassword = ""
                
            } view: {
                Toast()
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
