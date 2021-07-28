//
//  NoteList.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/22.
//

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
protocol NoteEntityProtocol {
    var id: String { get set }
    var content: String? { get set }
    var finished: EditState { get set }
    var postedDate: Date? { get set }
    var modifyDate: Date? { get set }
}

class NoteEntity: Identifiable, NoteEntityProtocol {
    var id: String = UUID().uuidString

    var content: String?

    var finished: EditState

    var postedDate: Date?

    var modifyDate: Date?

    init(title: String) {
        self.content = "content"
        self.finished = .draft
        self.postedDate = Date()
        self.modifyDate = nil
    }
}

struct NoteList_Previews: PreviewProvider {

    class NoteViewModelMock: NoteViewModelProtocol {
        @Published var list: [NoteEntity] = [NoteEntity]()

        init() {
            (0..<10).forEach { i in
                self.list.append(NoteEntity(title: "card: \(i)"))
            }
        }
    }
    static var previews: some View {
        NoteList<NoteViewModelMock>(viewModel: NoteViewModelMock())
    }
}
