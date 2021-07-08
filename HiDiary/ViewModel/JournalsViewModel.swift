//
//  JournalsViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/08.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {

    @Published private(set) var journals: [Journal] = Array(Journal.findAll())
    @Published var journalTextField = ""
    @Published var deleteJournal: Journal?
    @Published var isDeleteAllTapped = false

    private var addJournalTask: AnyCancellable?
    private var deleteJournalTask: AnyCancellable?
    private var deleteAlljournalTask: AnyCancellable?

    init() {
        addJournalTask = self.$journalTextField
            .sink() { text in
                guard !text.isEmpty else {
                    return
                }
                let journal = Journal()
                journal.text = text
                self.journals.append(journal)
                Journal.add(journal)
            }
        deleteJournalTask = self.$deleteJournal
            .sink() { journal in
                guard let journal = journal else {
                    return
                }
                if let index = self.journals.firstIndex(of: journal) {
                    self.journals.remove(at: index)
                    Journal.delete(journal)
                }
            }
        deleteAlljournalTask = self.$isDeleteAllTapped
            .sink() { isDeleteAllTapped in
                if (isDeleteAllTapped) {
                    Journal.delete(self.journals)
                    self.journals.removeAll()
                    self.isDeleteAllTapped = false
                }
            }
    }
}
