//
//  InputView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI

struct InputView: View {
    @State var text: String = ""
    @Environment(\.presentationMode) var presentation
    @ObservedObject var storeService: FirebaseStoreService
    @EnvironmentObject var authService: FirebaseAuthenticationService

    @ObservedObject private var vm = MemoViewModel()

    var body: some View {

        GeometryReader { geometry in
            NavigationView {

                TextEditingView(contents: $vm.memoTextField)

                    .navigationBarTitle("Journal Entry", displayMode: .inline)
                    .background(NavigationConfigurator { navcon in
                        navcon.navigationBar.barTintColor = .white
                        navcon.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
                    })
                    .navigationBarItems(leading:
                                            Button(action: {
                                                self.presentation.wrappedValue.dismiss()
                                                #if DEBUG
                                                print("return Home")
                                                #endif
                                            }) {
                                                Image(systemName: "chevron.backward")
                                            },
                                        trailing:
                                            HStack {
                                                Button(action: {
                                                    // TODO: Post Journal
                                                    if let user = authService.user {
                                                        storeService.saveNotes(
                                                            user: user,
                                                            data: Note(id: "hello", title: "title", content: vm.memoTextField, finished: false, postedDate: Date(), modifyDate: nil, isPublic: true)
                                                        ) { error in
                                                            print(error)
                                                        }
                                                    }

                                                    print("post Journal")

                                                }) {
                                                    Image(systemName: "square.and.pencil")
                                                }
                                            }
                    )

            }
        }

    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var text: String = "test text."
        var body: some View {
            InputView(storeService: FirebaseStoreService()).environmentObject(FirebaseAuthenticationService())
        }
    }
}
