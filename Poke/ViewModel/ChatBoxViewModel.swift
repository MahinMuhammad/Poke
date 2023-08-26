//
//  ChatBoxViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/14/23.
//

import Foundation

final class ChatBoxViewModel:ObservableObject{
    @Published var senderEmail:String
    @Published var receiverEmail:String
    
    init(senderEmail:String, receiverEmail:String){
        self.senderEmail = senderEmail
        self.receiverEmail = receiverEmail
    }
}
