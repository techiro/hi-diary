//
//  TextEditor.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/06.
//

import SwiftUI

struct TextEditingView: View {
    @State private var fullText: String = ""
    @State var isTagMode = false
    @Binding var contents: String
    @Binding var isTappedTranslate: Bool
    @Binding var question: String
    var body: some View {

        KeyboardView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {

                        HStack {
                            Image(systemName: "scribble.variable")
                            Text(question)
                            Spacer()
                            Image(systemName: "xmark.circle")
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.action, lineWidth: 2.0)
                        )
                        .padding()
                        .background(Color.action)
                        .compositingGroup()        // Viewの要素をグループ化
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)

                        HStack {
                            Image(systemName: "person")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35.0, height: 35.0)
                                .clipShape(Circle())
                            Text("appgrape")
                                .font(.bold(.subheadline)())
                            Spacer()

                        }
                        .padding([.top, .leading])

                        HStack {
                            TextEditor(text: $contents)
                                .opacity(contents == "Note in Japanese" ? 0.25 : 1)
                                .font(.custom("HelveticaNeue", size: 15))
                            VStack {
                                Spacer()
                                Text(String(500 - contents.count))
                                    .font(.caption)
                                    .padding([.bottom, .trailing], 3.0)
                                    .frame(width: 26)

                            }

                        }
                        .background(Color.white)
                        .lineSpacing(5)
                        .accentColor(.action)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.action, lineWidth: 2.0)
                        )
                        .onTapGesture {
                            if contents == "Note in Japanese" {
                                self.contents = ""
                            }
                        }

                        if isTappedTranslate {
                            Spacer()
                                .frame(width: 100, height: 20, alignment: .center)

                            HStack {
                                Image(systemName: "t.bubble.fill")
                                Text("Translate")
                                    .font(.bold(.subheadline)())
                                Spacer()

                            }
                            .padding(.leading)

                            TextEditor(text: $contents)
                                .font(.custom("HelveticaNeue", size: 15))
                                .lineSpacing(5)
                                .accentColor(.action)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.action, lineWidth: 2.0)
                                )
                        }
                    }
                }

                if isTagMode {
                    Color.gray.opacity(0.6)
                }
            }
        } toolBar: {
            ToolBarView(isTappedTranslate: $isTappedTranslate)
        }

    }
}

struct TextEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditingView(contents: .constant(
                            "今日は、久しぶりに友達と一緒に食事に行って楽しかった。\n来週の金曜日に最近流行りの映画を見に行く予定！楽しみだなー。"),
                        isTappedTranslate: .constant(true),
                        question: .constant("どこか外出しましたか？"))
            .background(Color.background)
    }
}
