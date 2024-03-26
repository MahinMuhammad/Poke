//
//  Extensions.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 1/10/24.
//

import SwiftUI

//MARK: - UIGestureRecognizerDelegate
//to implement swipe back with navigationbarhidden()
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && AuthManager.shared.isSignedIn
    }
}
