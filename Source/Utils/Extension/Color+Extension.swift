//
//  Color+Extension.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/06.
//

import SwiftUI

extension Color {
    static let action = Color(UIColor.action ?? .red)
    static let background = Color(UIColor.background ?? .systemPink)
    static let chat = Color(UIColor.chat ?? .systemGroupedBackground)
}

extension UIColor {
    static let action = UIColor(named: "ActionColor")
    static let background = UIColor(named: "Background")
    static let chat = UIColor(named: "ContentsBackgroundColor")
}
