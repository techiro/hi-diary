//
//  HomeView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authService: FirebaseAuthenticationService

    @State var tabSelection: Tabs = Tabs.diary

    @State var subscriptions = Set<AnyCancellable>()
    var body: some View {
        TabView(selection: $tabSelection) {
            Button("Show Second View") {
                tabSelection = Tabs.correct
            }
            .padding()
            .tabItem {
                Label(Tabs.diary.description, systemImage: Tabs.diary.systemimage)
            }
            .tag(Tabs.diary)

            Button("Show Third View") {
                tabSelection = Tabs.notifications
            }
            .padding()
            .tabItem {
                Label(Tabs.correct.description, systemImage: Tabs.correct.systemimage)
            }
            .tag(Tabs.correct)

            ZStack {
                Color.yellow
                Button("Show First View") {
                    tabSelection = Tabs.diary
                }
            }
            .padding()
            .tabItem {
                Label(Tabs.notifications.description, systemImage: Tabs.notifications.systemimage)
            }
            .tag(Tabs.notifications)

            SignOutView()
                .padding()
                .tabItem {
                    Label(Tabs.settings.description, systemImage: Tabs.settings.systemimage)
                }
                .tag(Tabs.settings)
                .edgesIgnoringSafeArea(.all)
        }

        .overlay(FloatingActionButton(bottomPadding: 60), alignment: .bottom)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Session(isLogin: true, user: User(uid: "LJK+JEJFEW3534KJLFJE", email: "test@gmail.com", displayName: "@hiro")))
    }
}
