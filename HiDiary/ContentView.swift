//
//  ContentView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/03.
//

import SwiftUI

struct ContentView: View {
    @State var selectedView = 1
    @State private var tabViewOffset: CGFloat = 0
    var body: some View {
        TabView(selection: $selectedView) {
            
            Button("Show Second View") {
                selectedView = 2
            }
            .padding()
            .tabItem {
                Label("First", systemImage: "1.circle")
            }
            .tag(1)
            
            Button("Show First View") {
                selectedView = 1
            }
            .padding()
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }
            .tag(2)
        }
        .overlay(FloatingActionButton(bottomPadding: 60), alignment: .bottom)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView().previewDevice("iPhone 8").landscape()
    }
}
