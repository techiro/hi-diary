//
//  Toast.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/20.
//

import SwiftUI

struct Toast: View {
    var title: String = ""
    var subTitle: String = ""
    var image: Image = Image(systemName: "sun.min")

    var body: some View {
        ZStack {
            HStack {
                image
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .padding()
                VStack {
                    Text(title)
                        .fontWeight(.bold)
                    Text(subTitle)
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
            Toast(title: "タイトル", subTitle: "サブタイトル", image: Image(systemName: "bookmark.fill"))
        }
    }
}
