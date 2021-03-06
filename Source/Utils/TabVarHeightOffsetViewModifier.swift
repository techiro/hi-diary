//
//  TabVarHeightOffsetViewModifier.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/20.
//

import SwiftUI

struct TabBarHeighOffsetViewModifier: ViewModifier {
    let action: (CGFloat) -> Void

    // MARK: this screenSafeArea helps determine the correct tab bar height depending on device version

    private let screenSafeArea = (UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.bottom ?? 34)

    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .onAppear {
                    let offset = proxy.safeAreaInsets.bottom - screenSafeArea
                    action(offset)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    let offset = proxy.safeAreaInsets.bottom - screenSafeArea
                    action(offset)
                }
        }
    }
}

extension View {
    func tabBarHeightOffset(perform action: @escaping (CGFloat) -> Void) -> some View {
        modifier(TabBarHeighOffsetViewModifier(action: action))
    }
}

struct TabVarHeightOffsetViewModifier: View {
    var body: some View {
        TabView {
            Text("Add the extension on subviews of tabview")
                .tabBarHeightOffset { offset in
                    print("the offset of tabview is -\(offset)")
                }
        }
    }
}

struct TabVarHeightOffsetViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        TabVarHeightOffsetViewModifier()
    }
}
