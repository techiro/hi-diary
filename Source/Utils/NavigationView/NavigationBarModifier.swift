//
//  NavigationBarModifier.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/05.
//
import SwiftUI
import UIKit

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context _: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context _: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            configure(nc)
        }
    }
}
