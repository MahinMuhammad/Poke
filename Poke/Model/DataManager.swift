//
//  DataManager.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation
import Firebase

final class DataManager{
    static let shared = DataManager()
    
    func isUserNameUnique(for userName:String)->Bool{
        
        return true
    }
    
    func isEmailUnique(for email:String)->Bool{
        
        return true
    }
}
