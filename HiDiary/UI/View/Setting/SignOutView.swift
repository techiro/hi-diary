//
//  LogOutView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//
import PopupView
import SwiftUI

struct SignOutView: View {
    @EnvironmentObject var authService: FirebaseAuthenticationService
    @State var subTitle = ""
    // MARK: テスト用プロパティー
    @State var isShowToast = false
    var body: some View {

        VStack {
            Text(self.authService.user?.displayName ?? "sample Name")
            Text(self.authService.user?.email ?? "sample email")
            Text(self.authService.user?.uid ?? "sample uid")
            Text(subTitle)

            Button(action: {
                do {
                    try authService.signOut()
                } catch {
                    subTitle = error.localizedDescription
                    isShowToast = true
                }
            },
            label: {
                Text("LogOut")
                    .fontWeight(.medium)
                    .frame(minWidth: 160)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            })

            Button(action: {
                isShowToast = true
            }, label: {
                Text("Toast")
                    .fontWeight(.medium)
                    .frame(minWidth: 160)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            })

            .popup(isPresented: $isShowToast, type: .toast, position: .bottom, animation: .easeIn, autohideIn: 1, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {

            } view: {
                Toast(title: "サインアウト", subTitle: subTitle, image: Image(systemName: "xmark.circle"))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
            }
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView().environmentObject(FirebaseAuthenticationService())
    }
}
