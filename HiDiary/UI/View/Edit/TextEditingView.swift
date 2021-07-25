//
//  TextEditor.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/06.
//

import SwiftUI

struct TextEditingView: View {
    @State private var fullText: String = ""
    @Binding var contents: String
    @Binding var isTappedTranslate: Bool
    var body: some View {

        KeyboardView {
            ScrollView(.vertical) {
                VStack {
                    TextEditor(text: $contents)
                        .font(.custom("HelveticaNeue", size: 20))
                        .lineSpacing(5)
                        .accentColor(.action)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.action, lineWidth: 2.0)
                        )

                    if isTappedTranslate {
                        HStack {
                            Image(systemName: "t.bubble.fill")
                            Text("Translate")
                                .font(.title2)

                        }
                        .frame(height: 50)
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

        } toolBar: {
            ToolBarView(isTappedTranslate: $isTappedTranslate)
        }

    }
}

struct TextEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditingView(contents: .constant("textEditing"), isTappedTranslate: .constant(true))
            .background(Color.background)
    }
}
