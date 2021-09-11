//
//  NoteRow.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import SwiftUI

struct NoteRow: View {
    @State var note: Note

    var body: some View {
        return VStack(alignment: .center, spacing: 8, content: {
            HStack(alignment: .center, spacing: 16, content: {
                Text(note.title ?? "")
                Spacer()
                Image("tick-box")
            })
            Divider()
            Text(note.content ?? "")
        })
    }
}

#if DEBUG
struct NoteRowPreviews: PreviewProvider {
    static var previews: some View {
        let testNote = Note(
            id: "123",
            title: "This is a test note",
            content: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Fusce gravida nulla tortor, nec sollicitudin tortor.
""",
            finished: false)

        return NoteRow(note: testNote)
    }
}
#endif

import Foundation
import SwiftUI

struct Note: Identifiable {
    var id: String
    var title: String?
    var content: String?
    var finished: Bool?
    var postedDate: Date?
    var lastModifiDate: Date?

    /// Maps a dictionary containing a note to a Note object
    /// If the ID is non-existent this will fail.
    static func map(fromDict dict: [String: Any]) -> Note? {

        // Make sure that the note has an id
        guard let id = dict["id"] as? String else { return nil }

        // Get the rest of the values
        let title = dict["title"] as? String
        let content = dict["content"] as? String
        let finished = dict["finished"] as? Bool

        // Return the note
        return Note(id: id, title: title,
                    content: content, finished: finished)
    }
}
