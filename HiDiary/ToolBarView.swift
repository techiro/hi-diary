//
//  ToolBarView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/07.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }, label: {
                Text("Done")
            })
        }
        .padding(.all)
        .foregroundColor(.gray)
        .background(Color.white)
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView()
    }
}
