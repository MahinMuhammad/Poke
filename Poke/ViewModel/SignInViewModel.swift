//
//  SignInViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import Foundation

final class SignInViewModel: ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""

    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    let authManager = AuthManager.shared
    
    func signInPressed(use router:Router){
        authManager.signInUser(email: email, password: password, use: router)
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
