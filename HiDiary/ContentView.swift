//
//  ContentView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: FirebaseAuthenticationService
    @State var selectedView = 1
    @State private var tabViewOffset: CGFloat = 0
    var body: some View {
        #if DEBUG
        HomeView().environmentObject(self.authService)
        
        #elseif RELEASE
        if self.authService.user != nil {
            HomeView().environmentObject(self.authService)
        } else {
            LoginView().environmentObject(self.authService)
        }
        #endif
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView().previewDevice("iPhone 8").landscape().environmentObject(FirebaseAuthenticationService())
    }
}
