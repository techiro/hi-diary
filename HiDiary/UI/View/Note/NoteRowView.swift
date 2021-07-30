//
//  NoteRow.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import SwiftUI

extension Color {
    static let Card_Background = Color("Card_Background")
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
                    Text(note.id)
                        .font(.title2)
                    Spacer()
                    Image(note.isPublic! ? "public" : "private")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                Text("2021-7-22")
                    .font(.footnote)
                    .multilineTextAlignment(.trailing)
            }
            
            Divider()
                .foregroundColor(.white)
            
            VStack{
                Text(note.content ?? "")
                HStack{
                    Image("heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(note.like ?? "")
                        .foregroundColor(.black)
                        .font(.caption)
                    Spacer()
                        .frame(width: 30)
                    Image("comments")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(note.comments ?? "")
                        .foregroundColor(.black)
                        .font(.caption)
                    Spacer()
                }
            }
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(10)
        .cornerRadius(12.0)
        .padding()
        .background(Color.Card_Background)
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

        return NoteRow(note: testNote)
    }
}
#endif
