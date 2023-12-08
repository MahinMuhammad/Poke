//
//  ProfileViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 11/30/23.
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
import _PhotosUI_SwiftUI

final class ProfileViewModel:ObservableObject{
    @Published var user:User?
    @Published var loadingFinished = false
    @Published var shouldPresentPhotoPicker = false
    @Published var selectedPickerItem: PhotosPickerItem?
    
    func loadUser(){
        user = nil
        loadingFinished = false
        UserDataManager.shared.readUserData(){ user in
            self.user = user
            self.loadingFinished = true
            print("User data fetched!")
        }
    }
    
    func userLoaded()->Bool{
        return user != nil && loadingFinished
    }
    
    func failedToLoadUser()->Bool{
        return user == nil && loadingFinished
    }
    
    func selectedPickerItemChanged(to newItem:PhotosPickerItem){
        Task{
            do{
                if let data = try await newItem.loadTransferable(type: Data.self){
                    updateProfilePicture(with: data)
                    return
                }
                
            }catch{
                print("Failed to retrive data from Picker Image with error: \(error)")
            }
        }
    }
    
    func updateProfilePicture(with data:Data){
        DispatchQueue.main.async {
            self.loadingFinished = false
        }
        guard let user else {fatalError("user not found while updating profile picture")}
        UserDataManager.shared.storeProfilePicture(of: user.uid, with: data) { profilePictureAddress, error in
            if let error{
                print("Failed to upload profile picture with error: \(error)")
            }else if let profilePictureAddress{
                let updatedUser = User(name: user.name, uid: user.uid, email: user.email, profilePicture: profilePictureAddress)
                UserDataManager.shared.updateUserData(of: updatedUser) { error in
                    if error == nil{
                        print("Profile picture updated!")
                        self.user = updatedUser
                        self.loadingFinished = true
                    }
                }
            }
        }
    }
}
