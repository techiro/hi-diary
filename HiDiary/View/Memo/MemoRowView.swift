//
//  MemoRowView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/13.
//

import SwiftUI

struct MemoRowView: View {
    var memo: Memo

    var body: some View {
        VStack(alignment: .leading) {
            Text(formatDate(memo.postedDate))
                .font(.caption)
                .fontWeight(.bold)
            Text(memo.text)
                .font(.body)
        }
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
}

struct MemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
        // TODO: https://qiita.com/rymshm/items/a5469671194701e36861
    }
}
