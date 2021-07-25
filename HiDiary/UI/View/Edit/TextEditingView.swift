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

    var body: some View {

        KeyboardView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
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

                        TextEditor(text: $contents)
                            .opacity(contents == "Note in Japanese" ? 0.25 : 1)
                            .font(.custom("HelveticaNeue", size: 20))
                            .lineSpacing(5)
                            .accentColor(.action)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
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
                                .font(.custom("HelveticaNeue", size: 20))
                                .lineSpacing(5)
                                .accentColor(.action)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
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
            ToolBarView(isTappedTranslate: $isTappedTranslate, isTagMode: $isTagMode)
        }

    }
}

struct TextEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditingView(contents: .constant(""), isTappedTranslate: .constant(true))
            .background(Color.background)
    }
}
