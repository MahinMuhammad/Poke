//
//  Chat.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import Foundation

struct Chat: Hashable, Identifiable{
    var id: String
    var senderEmail:String
    var receiverEmail:String
    var content:String
}
