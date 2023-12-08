//
//  K.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
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

struct K{
    struct Colors{
        static let canvasColor = "CanvasdColor"
        static let fieledColor = "FieledColor"
        static let fieldColorDark = "FieldColorDark"
        static let secondaryColor = "SecondaryColor"
        static let primaryColor = "PrimaryColor"
        static let fontColor = "FontColor"
    }
    
    struct FStore{
        static let userCollectionName = "users"
        static let nameField = "name"
        static let uidField = "uid"
        static let prfilePictureUrlField = "prfilePictureUrl"
        
        //for cloud storage
        static func getProfilePictureCloudPath(of uid:String)->String{
            return "profilePictures/\(uid).jpg"
        }
    }
}
