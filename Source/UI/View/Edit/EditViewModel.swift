//
//  EditViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/24.
//

import Foundation

class EditViewModel: ObservableObject {
    @Published var memoTextField = "Note in Japanese"
    @Published var editPhase: EditPhase = .writing
    @Published var questionString = "どこか外出しましたか？"
    // TODO: EnvironmentObjectに変更
    @Published var isPublic = true
}

enum EditPhase {
    case writing
    case draft
    case delete
}
