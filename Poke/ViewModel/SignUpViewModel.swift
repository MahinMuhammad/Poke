//
//  SignUpViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import Foundation

final class SignUpViewModel: ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var passwordVisible = false
    
    func showPasswordPressed(){
        passwordVisible.toggle()
    }
    
    func getEyeImage()->String{
        return passwordVisible ? "eye" : "eye.slash.fill"
    }
    
    func signUpPressed(){
        print("Sign Up")
    }
}
