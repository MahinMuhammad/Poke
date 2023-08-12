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
    
    @Published var user:User?
    
    func isUserNameUnique(for userName:String)->Bool{
        
        return true
    }
    
    
//    func readUserData(){
//        self.user = nil
//        let firestoreCollection = db.collection(K.FStore.userCollectionName)
//
//        if let currentUserEmail = Auth.auth().currentUser?.email{
//            let userDataCollection = firestoreCollection.whereField(K.FStore.emailField, isEqualTo: currentUserEmail)
//            userDataCollection.getDocuments { querySnapshot, error in
//                if let e = error{
//                    print("Failed to retrive user data: \(e)")
//                }else{
//                    if let snapshotDocuments = querySnapshot?.documents{
//                        let data = snapshotDocuments[0].data()
//                        if let firstName = data[K.FStore.firstNameField] as? String, let lastName = data[K.FStore.lastNameField] as? String, let email = data[K.FStore.emailField] as? String{
//                            self.userData = UserData(firstName: firstName, lastname: lastName, email: email)
//                        }
//                    }
//                }
//            }
//        }
//    }
    
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
