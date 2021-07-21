//
//  Tabs.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/21.
//

enum Tabs: CustomStringConvertible {
    
    case diary, settings, correct, notifications
    
    var description: String {
        switch self {
        case .diary:
            return "Diary"
        case .settings:
            return "Settings"
        case .correct:
            return "Correct"
        case .notifications:
            return "Notifications"
        }
    }
    var systemimage: String {
        switch self {
        case .diary:
            return "book"
        case .settings:
            return "person"
        case .correct:
            return "quote.bubble"
        case .notifications:
            return "bell"
        }
    }
}
