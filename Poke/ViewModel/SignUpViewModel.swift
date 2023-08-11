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
    
    let dataManager = DataManager.shared
    
    func signUpPressed(){
        print("Sign Up")
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
        }else{
            if !dataManager.isUserNameUnique(for: userName){
                flag = false
                userNameWarning = "User Name already in use"
            }
        }
        if email == ""{
            flag = false
            emailWarning = "Email Required"
        }else{
            if !dataManager.isEmailUnique(for: email){
                flag = false
                emailWarning = "Email already in use"
            }
        }
        if password == ""{
            flag = false
            passwordWarning = "Password Required"
        }
        return flag
    }
}
