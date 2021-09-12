//
//  NoteList.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

import FirebaseFirestoreSwift
import SwiftUI

struct NoteList<T: NoteViewModelProtocol>: View {
    @ObservedObject var viewModel: T

    var body: some View {
        List(self.viewModel.list, id: \.id) { note in
            HStack {
                NoteRow(note: note)
            }
            .padding(6)
        }
    }
}

protocol NoteViewModelProtocol: ObservableObject {
    associatedtype ListData: NoteEntityProtocol
    var list: [ListData] { get set }
}

class NoteEntity: Identifiable, NoteEntityProtocol {
    var icon: String?
    var id: String?
    var content: String?
    var finished: Bool
    var postedDate: Date?
    var modifyDate: Date?
    var like: String?
    var comments: String?
    var isPublic: Bool

    init(title _: String) {
        content = "content"
        finished = false
        postedDate = Date()
        modifyDate = nil
        like = nil
        icon = "user_icon"
        comments = nil
        isPublic = false
    }
}

struct NoteList_Previews: PreviewProvider {
    class NoteViewModelMock: NoteViewModelProtocol {
        @Published var list = [NoteEntity]()

        init() {
            (0 ..< 10).forEach { i in
                self.list.append(NoteEntity(title: "card: \(i)"))
            }
        }
    }

    static var previews: some View {
        NoteList<NoteViewModelMock>(viewModel: NoteViewModelMock())
    }
}
