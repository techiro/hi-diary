//
//  JournalListView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/08.
//

import SwiftUI

struct JournalListView: View {
    @ObservedObject var viewModel = JournalViewModel()

    @State private var isJournalTextFieldPresented = false
    @State private var isDeleteAlertPresented = false
    @State private var isDeleteAllAlertPresented = false
    @State private var journalTextField = ""

    var body: some View {
        NavigationView {
            VStack {
                if isJournalTextFieldPresented {
                    TextField("メモを入力してください", text: $journalTextField)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.asciiCapable)
                }
                List {
                    ForEach(viewModel.journals.sorted {
                        $0.postedDate > $1.postedDate
                    }) { journal in
                        HStack {
                            JournalRowView(journal: journal)
                            Spacer()
                            // Buttonにすると行全体にタップ判定がついてしまったので、Text.onTapGestureを代わりに使っている
                            Text("削除").onTapGesture {
                                isDeleteAlertPresented.toggle()
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                        }
                        .alert(isPresented: $isDeleteAlertPresented) {
                            Alert(title: Text("警告"),
                                  message: Text("メモを削除します。\nよろしいですか？"),
                                  primaryButton: .cancel(Text("いいえ")),
                                  secondaryButton: .destructive(Text("はい")) {
                                    viewModel.deleteJournal = journal
                                  }
                            )
                        }
                    }
                }
            }
            .navigationTitle("メモの一覧")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("全削除") {
                        isDeleteAllAlertPresented.toggle()
                    }
                    .disabled(viewModel.journals.isEmpty)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("追加") {
                        if (isJournalTextFieldPresented) {
                            viewModel.journalTextField = journalTextField
                            journalTextField = ""
                        }
                        isJournalTextFieldPresented.toggle()
                    }.disabled(isJournalTextFieldPresented && journalTextField.isEmpty)
                }
            }
            .alert(isPresented: $isDeleteAllAlertPresented) {
                Alert(title: Text("警告"),
                      message: Text("全てのメモを削除します。\nよろしいですか？"),
                      primaryButton: .cancel(Text("いいえ")),
                      secondaryButton: .destructive(Text("はい")) {
                        viewModel.isDeleteAllTapped = true
                      }
                )
            }
        }
    }
}



struct JournalListView_Previews: PreviewProvider {
    static var previews: some View {
        JournalListView()
    }
}
