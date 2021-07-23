//
//  FloatingButton.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import Foundation
import SwiftUI

struct FloatingActionButton: View {
    var bottomPadding: CGFloat = 0
    @EnvironmentObject var authService: FirebaseAuthenticationService
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {

                    self.showingSheet.toggle()

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
                .sheet(isPresented: $showingSheet) {
                    InputView(storeService: FirebaseStoreService()).environmentObject(authService)
                }

            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton().environmentObject(FirebaseAuthenticationService())
    }
}
