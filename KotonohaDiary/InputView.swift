//
//  InputView.swift
//  KotonohaDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI

struct InputView: View {
    @State var text: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    MultilineTextView(text: $text)
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                        .border(Color.gray)
                }
                .navigationBarTitle("07-05_16-45", displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = .brown
                    nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                })
                .navigationBarItems(leading:
                                        Button(action: {
                                            // TODO: return HomePage
                                            #if DEBUG
                                            print("return Home")
                                            #endif
                                        }) {
                                            Image(systemName: "chevron.backward")
                                        },
                                    trailing:
                                        HStack {
                                            Button(action: {
                                                // TODO: Post
                                                print("fjwef")
                                            }) {
                                                Image(systemName: "square.and.pencil")
                                            }
                                        }
                )
                
            }
        }
        
    }
}

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
        textView.delegate = context.coordinator
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
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State var text: String = "test text."
        var body: some View {
            InputView()
        }
    }
}
