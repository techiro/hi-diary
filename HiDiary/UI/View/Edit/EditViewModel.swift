//
//  EditViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/24.
//

import Foundation

class EditViewModel: ObservableObject {

    @Published var memoTextField = ""
    @Published var editPhase: EditPhase = .writing

}

enum EditPhase {
    case writing
    case draft
    case delete
}
