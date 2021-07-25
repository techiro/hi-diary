//
//  ToolBarView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/07.
//

import SwiftUI

struct ToolBarView: View {
    @Binding var isTappedTranslate: Bool
    @Binding var isTagMode: Bool
    var body: some View {
        HStack {
            Button(action: {
                isTappedTranslate.toggle()
            }, label: {
                HStack {
                    Image(systemName: "t.bubble.fill")
                    Text("Translate")
                }
            })
            Spacer()
                .frame(width: 10)
            Button(action: {
                // TODO: Open serect Tag View
                isTagMode.toggle()
            }, label: {
                HStack {
                    Image(systemName: "tag.fill")
                    Text("tag")
                }

            })

            Spacer()
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }, label: {
                Text("Done")
            })
        }
        .padding(.all)
        .foregroundColor(.blue)
        .background(Color.white)
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView(isTappedTranslate: .constant(true), isTagMode: .constant(false))
    }
}
