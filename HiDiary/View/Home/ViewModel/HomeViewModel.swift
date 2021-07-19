//
//  LoginViewModel.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/11.
//

import Combine
import Foundation
final class HomeViewModel: ObservableObject {
    // MARK: Private
   
    // MARK: Output
    @Published private(set) var canLogin: Bool = true
    @Published private(set) var memos: [Memo] = Array(Memo.findAll())
    
}
