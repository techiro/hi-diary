//
//  NoteRow.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import SwiftUI

extension Color {
    static let contents_backgroundColor = Color("contents_backgroundColor")
}

struct NoteRow<T: NoteEntityProtocol>: View {
    @State var note: T
    @State var isCheck: Bool = false
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                HStack(alignment: .center, spacing: 16, content: {
                    Image("user_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .background(Color.white)
                        .clipShape(Circle())
                    Text(note.id ?? "none")
                        .font(.title2)
                    Spacer()
                    Image(systemName: note.isPublic ? "globe" : "lock.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                Text("2021-7-22")
                    .font(.footnote)
                    .multilineTextAlignment(.trailing)
            }
            .padding(10)
            VStack {
                Text(note.content ?? "")
                HStack {
                    Image(systemName:"heart")
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
            .background(Color.contents_backgroundColor)
            .cornerRadius(10)
        }
        .padding(10)
        .cornerRadius(12.0)
        .padding()
        //        .background(Color.Card_Background)
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
            NoteRow(note: testNote)
                .preferredColorScheme(.dark)
            NoteRow(note: testNote)
        }
    }
}
#endif
