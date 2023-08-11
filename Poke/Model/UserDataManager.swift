//
//  DataManager.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import Firebase

final class UserDataManager{
    static let shared = UserDataManager()
    let db = Firestore.firestore()
    
    
    func isUserNameUnique(for userName:String)->Bool{
        
        return true
    }
    
    func isEmailUnique(for email:String)->Bool{
        
        return true
    }
    
    func storeUserData(name:String, userName:String, email:String){
        db.collection(K.FStore.userCollectionName).addDocument(data: [
            K.FStore.nameField : name,
            K.FStore.userNameField : userName,
            K.FStore.emailField : email
        ]){ error in
            if let e = error{
                print("Error adding user details: \(e)")
            }else{
                print("User details successfully added")
            }
        }
    }
}
