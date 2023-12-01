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
    
    func readUserData(completion: @escaping (User?)->Void){
        let firestoreCollection = db.collection(K.FStore.userCollectionName)

        if let currentUser = Auth.auth().currentUser{
            let userDataCollection = firestoreCollection.whereField(K.FStore.uidField, isEqualTo: currentUser.uid)
            userDataCollection.getDocuments { querySnapshot, error in
                if let error{
                    print("Failed to retrive user data: \(error)")
                    completion(nil)
                }else{
                    if let snapshotDocuments = querySnapshot?.documents{
                        let data = snapshotDocuments[0].data()
                        if let name = data[K.FStore.nameField] as? String, let uid = data[K.FStore.uidField] as? String{
                            guard let email = currentUser.email else{fatalError("failed to recieve email of current user while reading User data")}
                            let profilePicture = data[K.FStore.prfilePictureUrlField] as? String
                            let user = User(name: name, uid: uid, email: email, profilePicture: profilePicture)
                            completion(user)
                        }
                    }
                }
            }
        }
        else{
            fatalError("No current user found while reading User Data")
        }
    }
    
    func storeUserData(name:String, profilePictureUrl:String?, uid:String, completion: @escaping(Error?)->Void){
        db.collection(K.FStore.userCollectionName).addDocument(data: [
            K.FStore.nameField : name,
            K.FStore.prfilePictureUrlField : profilePictureUrl as Any,
            K.FStore.uidField : uid
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
