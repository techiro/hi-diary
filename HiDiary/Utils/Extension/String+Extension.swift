//
//  String+Extension.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/12.
//

import Foundation

extension String {
    // 半角英数かどうか判別
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
