//
//  ViewFactory.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import SwiftUI

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case .signIn:
            SignInView()
        case .signUp:
            SignUpView()
        }
    }
}
