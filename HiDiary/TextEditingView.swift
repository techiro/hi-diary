//
//  TextEditor.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/06.
//

import SwiftUI

struct TextEditingView: View {
    @State private var fullText: String = ""
    
    var body: some View {
        KeyboardView {
            TextEditor(text: $fullText)
                .font(.custom("HelveticaNeue", size: 20))
                .lineSpacing(5)
                .accentColor(.action)
        } toolBar: {
            ToolBarView()
            
        }
    }
}

struct TextEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditingView()
            .background(Color.background)
    }
}
