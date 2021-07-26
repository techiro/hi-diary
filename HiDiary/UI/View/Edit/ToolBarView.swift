//
//  ToolBarView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/07.
//

import SwiftUI

struct ToolBarView: View {
    @Binding var isTappedTranslate: Bool
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

            Spacer()
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }, label: {
                Text("Next")
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
