//
//  Post.swift
//  HiDiary
//
//  Created by arakawaLab on 2021/08/21.
//

import SwiftUI

struct Post: View {
    @State private var content = ""
    private static let placeholder = "思ったことを書いてみよう"
    @State private var placeholderText = placeholder

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text("UserName")

                Spacer()

                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 16, height: 17)
                Text("全員に公開")
                    .font(.caption)
            }
            .padding(20)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder().foregroundColor(.gray)
                    .background(Color.clear)
                TextEditor(text: $content)
                    .padding()
                    .foregroundColor(.black)
                    .onTapGesture {
                        if content.isEmpty {
                            placeholderText = ""
                        }
                    }
                    .onChange(of: content) { value in
                        if content.isEmpty {
                            placeholderText = Self.placeholder
                        } else {
                            placeholderText = ""
                        }
                    }
                Text(placeholderText)
                    .padding()
                    .foregroundColor(.gray)
            }
            .frame(width: 370, height: 338, alignment: .center)
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}
