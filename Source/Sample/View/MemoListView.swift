//
//  MemoListView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/13.
//

import SwiftUI

struct MemoListView: View {
    @ObservedObject var viewModel = MemoViewModel()

    @State private var isDeleteAlertPresented = false
    @State private var isDeleteAllAlertPresented = false
    @State private var memoTextField = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.memos.sorted {
                        $0.postedDate > $1.postedDate
                    }) { memo in
                        HStack {
                            MemoRowView(memo: memo)
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
                                      viewModel.deleteMemo = memo
                                  })
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
                    .disabled(viewModel.memos.isEmpty)
                }
            }
            .alert(isPresented: $isDeleteAllAlertPresented) {
                Alert(title: Text("警告"),
                      message: Text("全てのメモを削除します。\nよろしいですか？"),
                      primaryButton: .cancel(Text("いいえ")),
                      secondaryButton: .destructive(Text("はい")) {
                          viewModel.isDeleteAllTapped = true
                      })
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
