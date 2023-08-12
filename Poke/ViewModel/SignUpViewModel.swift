//
//  SignUpViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import Foundation
import Firebase

final class SignUpViewModel: ObservableObject{
    @Published var name:String = ""
    @Published var userName:String = ""
    @Published var email:String = ""
    @Published var password:String = ""
    
    @Published var nameWarning:String?
    @Published var userNameWarning:String?
    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    let userDataManager = UserDataManager.shared
    let authManager = AuthManager.shared
    
    func signUpPressed(){
        authManager.signUpUser(name: name, userName: userName, email: email, password: password){ error in
            if let err = error{
                let nsError = err as NSError
                switch nsError.code{
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    self.emailWarning = "email is alreay in use"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.emailWarning = "email is invalid"
                default:
                    print("Failed to sign up with error: \(err)")
                }
            }
        }
    }
    
    func isFormValid()->Bool{
        var flag:Bool = true
        nameWarning = ""
        userNameWarning = ""
        emailWarning = ""
        passwordWarning = ""
        if name == ""{
            flag = false
            nameWarning = "Name Required"
        }
        if userName == ""{
            flag = false
            userNameWarning = "User Name required"
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
