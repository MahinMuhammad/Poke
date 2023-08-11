//
//  SignUpViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import Foundation

final class SignUpViewModel: ObservableObject{
    @Published var name:String = ""
    @Published var userName:String = ""
    @Published var email:String = ""
    @Published var password:String = ""
    
    @Published var nameWarning:String?
    @Published var userNameWarning:String?
    @Published var emailWarning:String?
    @Published var passwordWarning:String?
    
    func signUpPressed(){
        print("Sign Up")
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
