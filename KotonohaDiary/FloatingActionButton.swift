//
//  FloatingButton.swift
//  KotonohaDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import Foundation
import SwiftUI
struct FloatingActionButton: View {
    var bottomPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // TODO: Implement Open Edit View
                    print("Tapped!!")
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 30)) // --- 4
                })
                    .frame(width: 70, height: 70)
                    .background(Color.orange)
                    .cornerRadius(35.0)
                .shadow(color: .gray, radius: 3, x: 2, y: 2)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: bottomPadding, trailing: 16.0)) // --- 5

            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
    }
}
