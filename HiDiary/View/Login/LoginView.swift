//
//  LoginView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: Session
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    @ObservedObject private var vm = LoginViewModel()
    @State var subscriptions = Set<AnyCancellable>()
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("SwiftUI App")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail address", text: $vm.userId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                   print("Login処理")
                
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
                .disabled(!vm.canLogin)
                Text(vm.validationText)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
