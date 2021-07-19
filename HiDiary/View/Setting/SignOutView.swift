//
//  LogOutView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//

import SwiftUI

struct SignOutView: View {
    private var vm = FirebaseAuthViewModel()
    
    var body: some View {
        
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
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
