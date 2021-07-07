//
//  ToolBarView.swift
//  KotonohaDiary
//
//  Created by TanakaHirokazu on 2021/07/07.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        HStack {
            Button(action: {
                // TODO: Open Photo
                #if DEBUG
                print("Open Photo")
                #endif
            }) {
                Image(systemName: "photo")
                
            }.padding([.trailing], 16)
            
            Button(action: {
                // TODO: Open Camera
                #if DEBUG
                print("Open Camera")
                #endif
            }) {
                Image(systemName: "camera")
                
            }.padding([.trailing], 16)
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
