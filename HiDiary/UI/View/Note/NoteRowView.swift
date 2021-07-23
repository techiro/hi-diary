//
//  NoteRow.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import SwiftUI

struct NoteRow<T: NoteEntityProtocol>: View {
    @State var note: T
    @State var isCheck: Bool = false
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                HStack(alignment: .center, spacing: 16, content: {
                    Text(note.title ?? "")
                        .font(.title)
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(isCheck ? .green : .gray)
                })
                Text("2021-7-22")
                    .font(.footnote)
                    .multilineTextAlignment(.trailing)
            }

            Divider()
                .foregroundColor(.white)
            Text(note.content ?? "")
        }
        .padding(20)
        .background(Color.blue)
        .cornerRadius(12.0)
        .padding()
        .onAppear {
            self.isCheck = note.finished
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

#if DEBUG
struct NoteRowPreviews: PreviewProvider {
    static var previews: some View {
        let testNote = Note(
            id: "123",
            title: "This is a test note",
            content:
                """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Fusce gravida nulla tortor, nec sollicitudin tortor.
""",
            finished: false, postedDate: nil, modifyDate: nil)

        return NoteRow(note: testNote)
    }
}
#endif
