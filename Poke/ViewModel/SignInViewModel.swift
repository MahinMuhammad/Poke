//
//  SignInViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

/*
 Copyright 2023 Md. Mahinur Rahman
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import Firebase

final class SignInViewModel: ObservableObject{
    
    @Published var email:String = Dummy.email
    @Published var password:String = Dummy.password

    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    let authManager = AuthManager.shared
    
    func signInPressed(){
        authManager.signInUser(email: email.lowercased(), password: password){error in
            if let error{
                let nsError = error as NSError
                switch nsError.code{
                case AuthErrorCode.userNotFound.rawValue:
                    self.emailWarning = "user not found"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.emailWarning = "email is invalid"
                case AuthErrorCode.wrongPassword.rawValue:
                    self.passwordWarning = "wrong password"
                default:
                    self.passwordWarning = "Failed to sign in!"
                    print("Failed to sign in with error: \(error)")
                }
            }
        }
    }
    
    func isFormValid()->Bool{
        var flag:Bool = true
        emailWarning = ""
        passwordWarning = ""
        if email == ""{
            flag = false
            emailWarning = "Email Required"
        }
        if password == ""{
            flag = false
            passwordWarning = "Password Required"
        }
        return flag
    }
}
