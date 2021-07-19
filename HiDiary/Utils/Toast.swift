//
//  Toast.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/20.
//

import SwiftUI

struct Toast: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .padding()
                VStack {
                    Text("ログインエラー")
                        .fontWeight(.bold)
                    Text("パスワードかメールアドレスが無効です")
                }
                
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
        }
        .cornerRadius(12)
        .padding()

    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            Toast()
        }
    }
}
