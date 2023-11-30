//
//  DataManager.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
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
import FirebaseFirestore

final class UserDataManager{
    static let shared = UserDataManager()
    let db = Firestore.firestore()
    
    @Published var user:User?
    
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
    
    func storeUserData(name:String, email:String, completion: @escaping(Error?)->Void){
        db.collection(K.FStore.userCollectionName).addDocument(data: [
            K.FStore.nameField : name,
            K.FStore.emailField : email
        ]){ error in
            if let error{
                print("Error adding user details: \(error)")
                completion(error)
            }else{
                print("User details successfully added")
                completion(nil)
            }
        }
    }
}
