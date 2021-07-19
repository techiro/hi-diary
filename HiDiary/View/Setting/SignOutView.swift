//
//  LogOutView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//
import PopupView
import SwiftUI

struct SignOutView: View {
    @EnvironmentObject var session: Session
    private var vm = FirebaseAuthViewModel()
    // MARK: テスト用プロパティー
    @State var isShowToast = false
    var body: some View {
        
        VStack {
            Text(self.session.user?.email ?? "sample email")
            Text(self.session.user?.uid ?? "sample user")
            Button(action: {
                do {
                    try vm.signOut()
                } catch {
                    print(error)
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
                Toast()
            }
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
