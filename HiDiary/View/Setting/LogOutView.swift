//
//  LogOutView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/19.
//

import FirebaseAuth
import SwiftUI

struct LogOutView: View {
    let firebaseAuth = Auth.auth()
    
    var body: some View {
        
        Button(action: {
           print("LogOut処理")
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
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
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView()
    }
}
