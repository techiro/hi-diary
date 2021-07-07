//
//  MultilineTextView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    
    final class Coordinator: NSObject, UITextViewDelegate {
        private var textView: MultilineTextView
        
        init(_ textView: MultilineTextView) {
            self.textView = textView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.textView.text = textView.text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .background
        textView.delegate = context.coordinator
        textView.tintColor = .action
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct MultilineTextView_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextView(text: .constant("今日はいい天気だった．"))
    }
}
