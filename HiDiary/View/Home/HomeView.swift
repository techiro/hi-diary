//
//  HomeView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: Session
    @State var selectedViewNum = 0
    @ObservedObject private var vm = HomeViewModel()
    
    @State var subscriptions = Set<AnyCancellable>()
    var body: some View {
        VStack {
            Text(self.session.user?.email ?? "")
            Text(self.session.user?.uid ?? "")
            
            TabView(selection: $selectedViewNum) {
                Button("Show Second View") {
                    selectedViewNum = 1
                }
                .padding()
                .tabItem {
                    Label("Diary", systemImage: "book")
                }
                .tag(0)
                
                Button("Show First View") {
                    selectedViewNum = 0
                }
                .padding()
                .tabItem {
                    Label("Correct", systemImage: "quote.bubble")
                }
                .tag(1)
                
                Button("Show First View") {
                    selectedViewNum = 0
                }
                .padding()
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
                .tag(2)
                
                SignOutView()
                    .padding()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(3)
            }
            .overlay(FloatingActionButton(bottomPadding: 60), alignment: .bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Session(isLogin: true, user: User(id: "@appgrape", name: "Hirokazu Tanaka")))
    }
}