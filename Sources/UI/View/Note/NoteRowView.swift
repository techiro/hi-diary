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
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())

                    Text(note.id ?? "none")
                        .font(.caption)

                    Spacer()
                    Image(systemName: note.isPublic ? "globe" : "lock.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text("2021-7-22")
                        .font(.footnote)
                        .multilineTextAlignment(.trailing)
                }

                )
            }
            .padding(10)

            VStack {
                Text(note.content ?? "")
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(note.like ?? "")
                        .font(.body)
                    Spacer()
                        .frame(width: 30)
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(note.comments ?? "")
                        .font(.body)
                    Spacer()
                }

            }
            .padding()
            .background(Color.chat)
            .cornerRadius(10)

        }
        .padding(10)
        .cornerRadius(12.0)
        .padding()
        .onAppear {
            self.isCheck = false
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
        let testNote = SampleNote()

        return Group {
            ZStack {

                NoteRow(note: testNote)
                    .preferredColorScheme(.light)
            }
        }
    }
}
#endif
