//
//  Router.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import SwiftUI

final class Router: ObservableObject{
    @Published var path = NavigationPath()
    
    func popToRoot(){
        path.removeLast(path.count)
    }
}
