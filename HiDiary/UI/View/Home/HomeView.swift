//
//  HomeView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//
import Combine
import SwiftUI

struct RefreshControl: View {

    @State private var isRefreshing = false
    var coordinateSpaceName: String
    var onRefresh: () -> Void

    var body: some View {
        GeometryReader { geometry in
            if geometry.frame(in: .named(coordinateSpaceName)).midY > 50 {
                Spacer()
                    .onAppear {
                        isRefreshing = true
                    }
            } else if geometry.frame(in: .named(coordinateSpaceName)).maxY < 10 {
                Spacer()
                    .onAppear {
                        if isRefreshing {
                            isRefreshing = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if isRefreshing {
                    ProgressView()
                } else {
                    Text("⬇︎")
                        .font(.system(size: 28))
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}

struct HomeView: View {
    @State var tabSelection: Tabs = Tabs.diary
    @State var isShowToast = false
    @State var isLoading = false
    @State var errorMessage = ""
    @State var subscriptions = Set<AnyCancellable>()

    @EnvironmentObject var storeService: FirebaseStoreService
    let mockNotes = [SampleNote(), SampleNote()]
    var body: some View {
        TabView(selection: $tabSelection) {
            ScrollView {

                VStack {
                    RefreshControl(coordinateSpaceName: "RefreshControl", onRefresh: { print("refresh") })

                    List(storeService.posts) { post in
                        NoteRow(note: post)

                    }
                    .padding()

                }

            }
            .coordinateSpace(name: "RefreshControl")
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
        .onAppear {
            storeService.getCodablePosts { error in
                if let error = error {
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
