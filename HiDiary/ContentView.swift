//
//  ContentView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: Session
    @State var selectedView = 1
    @State private var tabViewOffset: CGFloat = 0
    var body: some View {
        if self.session.isLogin {
            HomeView().environmentObject(self.session)
        } else {
            LoginView()
                .environmentObject(self.session)
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView().previewDevice("iPhone 8").landscape()
    }
}
