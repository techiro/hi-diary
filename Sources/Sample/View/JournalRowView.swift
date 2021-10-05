//
//  JournalRowView.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/08.
//

import SwiftUI

struct JournalRowView: View {
    var journal: Journal

    var body: some View {
        VStack(alignment: .leading) {
            Text(formatDate(journal.postedDate))
                .font(.caption)
                .fontWeight(.bold)
            Text(journal.text)
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

import RealmSwift
struct JournalRowView_Previews: PreviewProvider {
    static var previews: some View {
        JournalRowView(journal: Journal())
    }
}
