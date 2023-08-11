//
//  MainViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation

final class MainViewModel: ObservableObject{
    let authManager = AuthManager.shared
    
    func isSignedIn()->Bool{
        return authManager.isSignedIn
    }
}
