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
import FirebaseStorage

final class UserDataManager{
    static let shared = UserDataManager()
    let db = Firestore.firestore()
    let storage = Storage.storage()
    @Published var user:User?
    
    //MARK: - CRUD
    func readUserData(completion: @escaping (User?)->Void){
        guard let currentUser = Auth.auth().currentUser
        else{fatalError("No current user id found while reading User Data")}
        
        let docRef = db.collection(K.FStore.userCollectionName).document(currentUser.uid)
        
        docRef.getDocument { (document, error) in
            if let error{
                print("Failed to retrive user data: \(error)")
                completion(nil)
            }else{
                guard let document, let data = document.data()
                else {fatalError("No data or document found for current user while readind User data")}
                
                if let email = data[K.FStore.emailField] as? String{
                    let uid = document.documentID
                    let name = data[K.FStore.nameField] as? String ?? "Unknown"
                    let profilePicture = data[K.FStore.prfilePictureUrlField] as? String
                    let contactList = data[K.FStore.contactListField] as? [String] ?? []
                    let user = User(name: name, uid: uid, email: email, profilePicture: profilePicture, contactList: contactList)
                    completion(user)
                }else{
                    print("failed to recieve email of user while reading User data")
                    completion(nil)
                }
            }
        }
    }
    
    func storeUserData(name:String, email:String, profilePictureUrl:String?, uid:String, contactList:[String], completion: @escaping(Error?)->Void){
        db.collection(K.FStore.userCollectionName).document(uid).setData([
            K.FStore.nameField : name,
            K.FStore.emailField : email,
            K.FStore.prfilePictureUrlField : profilePictureUrl as Any,
            K.FStore.contactListField : contactList
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
    
    func updateUserData(of user:User, completion: @escaping(Error?)->Void){
        db.collection(K.FStore.userCollectionName).document(user.uid).setData([
            K.FStore.nameField : user.name,
            K.FStore.emailField : user.email,
            K.FStore.prfilePictureUrlField : user.profilePicture as Any
        ], merge: true){ error in
            if let error{
                print("Error updating user details: \(error)")
                completion(error)
            }else{
                print("User details successfully updated")
                completion(nil)
            }
        }
    }
    
    func updateContactList(of uid:String, contactList updatedList:[String]){
        
    }
    
    func deleteUserData(of uid:String){
        db.collection(K.FStore.userCollectionName).document(uid).delete(){ error in
            if let error{
                print("Failed to delete user document with error: \(error)")
            }else{
                print("User document deleted!")
            }
        }
    }
    
    //MARK: - Cloud storage to store image
    func storeProfilePicture(of uid:String, with data:Data, completion: @escaping (String?, Error?)->Void){
        let storageRef = storage.reference()
        let profilePictureRef = storageRef.child(K.FStore.getProfilePictureCloudPath(of: uid))
        
        profilePictureRef.putData(data){ metadata, error in
            if let error{
                completion(nil, error)
            }else{
                profilePictureRef.downloadURL(){ url, error in
                    guard let url else{completion(nil, error); return}
                    completion(url.absoluteString, nil)
                }
            }
        }
    }
}
