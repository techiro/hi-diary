//
//  InputView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI

struct InputView: View {
    @State var text: String = ""
    @State var isTappedTranslate = false
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var storeService: FirebaseStoreService
    @EnvironmentObject var authService: FirebaseAuthenticationService

    @ObservedObject private var vm = EditViewModel()

    var body: some View {

        NavigationView {

            TextEditingView(contents: $vm.memoTextField, isTappedTranslate: $isTappedTranslate, question: $vm.questionString)

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
                                                // TODO: Open Action Sheet 公開範囲の指定View
                                            }, label: {
                                                HStack {
                                                    Image(systemName: "lock.open")
                                                    Text("public")
                                                }
                                                .padding()
                                            })

                                            Button(action: {
                                                if let user = authService.user {
                                                    storeService.saveNotes(
                                                        user: user,
                                                        data: Note(id: "hello",
                                                                   title: "title",
                                                                   content: vm.memoTextField,
                                                                   finished: false,
                                                                   postedDate: Date(),
                                                                   modifyDate: nil,
                                                                   isPublic: true
                                                        )
                                                    ) { error in
                                                        guard error != nil else { return print("成功") }

                                                        fatalError("save失敗")
                                                    }
                                                }

                                                print("post Journal")
                                                self.presentation.wrappedValue.dismiss()

                                            }) {
                                                Image(systemName: "square.and.pencil")
                                            }
                                        }
                )

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
            InputView().environmentObject(FirebaseAuthenticationService()).environmentObject(FirebaseStoreService())
        }
    }
}
