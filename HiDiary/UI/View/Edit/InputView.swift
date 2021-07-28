//
//  InputView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI

struct InputView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var storeService: FirebaseStoreService
    @EnvironmentObject var authService: FirebaseAuthenticationService

    @ObservedObject private var vm = EditViewModel()

    @State var text: String = ""
    @State var isTappedTranslate = false

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
                                                vm.isPublic.toggle()
                                            }, label: {
                                                HStack {
                                                    if vm.isPublic {
                                                        Image(systemName: "lock.open")
                                                        Text("public")
                                                    } else {
                                                        Image(systemName: "lock")
                                                        Text("close")
                                                    }

                                                }
                                                .padding()
                                            })

                                            Button(action: {
                                                if let user = authService.user {
                                                    storeService.addNote(
                                                        note: Note(
                                                            content: vm.memoTextField,
                                                            finished: true,
                                                            postedDate: Date(),
                                                            modifyDate: nil,
                                                            isPublic: vm.isPublic
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
