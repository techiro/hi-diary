//
//  HomeView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import SwiftUI

struct HomeView: View {
    @State var tabSelection: Tabs = Tabs.diary
    @State var isShowToast = false
    @State var isLoading = false
    @State var errorMessage = ""
    @State var subscriptions = Set<AnyCancellable>()

    @EnvironmentObject var storeService: FirebaseStoreService
    let mockNotes = [SampleNote(), SampleNote(), SampleNote(), SampleNote(), SampleNote(), SampleNote()]
    var body: some View {
        TabView(selection: $tabSelection) {

            VStack {

                List(storeService.posts) { post in
                    NoteRow(note: post)

                }
                .padding()

            }

            .tabItem {
                Label(Tabs.diary.description,
                      systemImage: Tabs.diary.systemimage)
            }
            .tag(Tabs.diary)

            Button("Show Third View") {
                tabSelection = Tabs.notifications
            }
            .tabItem {
                Label(Tabs.correct.description,
                      systemImage: Tabs.correct.systemimage)
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
                Label(Tabs.notifications.description,
                      systemImage: Tabs.notifications.systemimage)
            }
            .tag(Tabs.notifications)

            SignOutView()
                .padding()
                .tabItem {
                    Label(Tabs.settings.description,
                          systemImage: Tabs.settings.systemimage)
                }
                .tag(Tabs.settings)
                .edgesIgnoringSafeArea(.all)
        }

        .overlay(FloatingActionButton(bottomPadding: 60), alignment: .bottom)
        .onAppear {
            storeService.getCodablePosts { error in
                if let error = error {
                    print(error.localizedDescription)
                    isShowToast = true
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseAuthenticationService())
    }
}
