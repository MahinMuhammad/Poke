//
//  SignInViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import Foundation
import Firebase

final class SignInViewModel: ObservableObject{
    
    @Published var email:String = Dummy.email
    @Published var password:String = Dummy.password

    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    let authManager = AuthManager.shared
    
    func signInPressed(){
        authManager.signInUser(email: email, password: password){error in
            if let err = error{
                let nsError = err as NSError
                switch nsError.code{
                case AuthErrorCode.userNotFound.rawValue:
                    self.emailWarning = "user not found"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.emailWarning = "email is invalid"
                case AuthErrorCode.wrongPassword.rawValue:
                    self.passwordWarning = "wrong password"
                default:
                    print("Failed to sign up with error: \(err)")
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
