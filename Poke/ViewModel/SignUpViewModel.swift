//
//  SignUpViewModel.swift
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

final class SignUpViewModel: ObservableObject{
    @Published var name:String = ""
    @Published var email:String = ""
    @Published var password:String = ""
    
    @Published var nameWarning:String?
    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    let userDataManager = UserDataManager.shared
    let authManager = AuthManager.shared
    
    func signUpPressed(){
        self.authManager.signUpUser(name: self.name, profilePictureUrl: nil, email: self.email.lowercased(), password: self.password){ error in
            if let error{
                let nsError = error as NSError
                switch nsError.code{
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    self.emailWarning = "email is alreay in use"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.emailWarning = "email is invalid"
                case AuthErrorCode.weakPassword.rawValue:
                    self.passwordWarning = "password is too weak"
                default:
                    self.passwordWarning = "Failed to sign up!"
                    print("Failed to sign up with error: \(error)")
                }
            }
        }
    }
    
    func isFormValid()->Bool{
        var flag:Bool = true
        nameWarning = ""
        emailWarning = ""
        passwordWarning = ""
        if name == ""{
            flag = false
            nameWarning = "Name Required"
        }
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
