//
//  AuthManager.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import Firebase

final class AuthManager: ObservableObject{
    static let shared = AuthManager()
    
    @Published var isSignedIn:Bool
    
    init() {
        if Auth.auth().currentUser != nil{
            self.isSignedIn = true
        }else{
            self.isSignedIn = false
        }
    }
    
    func signUpUser(name:String, userName:String, email:String, password:String, completion: @escaping (Error?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
            if let e = error{
                let err = e as NSError
                completion(err)
            }else{
                print("User registration successfull!")
                DispatchQueue.main.async {
                    UserDataManager.shared.storeUserData(name: name, userName: userName, email: email)
                    self.isSignedIn = true
                }
            }
        }
    }
    
    func signInUser(email:String, password:String, completion: @escaping (Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){ response, error in
            if let e = error{
                let err = e as NSError
                completion(err)
            }else{
                print("User signIn successfull!")
                DispatchQueue.main.async{
                    self.isSignedIn = true
                }
            }
        }
    }
    
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
