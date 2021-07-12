//
//  PreviewCheat.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//

import SwiftUI
// 参考　https://sarunw.com/posts/how-to-preview-a-device-in-landscape-orientation-with-swiftui-previews/
struct LandscapeModifier: ViewModifier {
    let height = UIScreen.main.bounds.width
    let width = UIScreen.main.bounds.height
    
    var isPad: Bool {
        return height >= 768
    }
    
    var isRegularWidth: Bool {
        return height >= 414
    }
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height))
            .environment(\.horizontalSizeClass, isRegularWidth ? .regular: .compact)
            .environment(\.verticalSizeClass, isPad ? .regular: .compact)
    }
}

extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}
