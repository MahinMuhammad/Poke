//
//  AuthManager.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import Firebase

final class AuthManager{
    static let shared = AuthManager()
    
    var isSignedIn: Bool{
        return Auth.auth().currentUser != nil ? true : false
    }
    
    
}
