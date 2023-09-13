//
//  ChatListViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/13/23.
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

final class ChatListViewModel: ObservableObject{
    @Published var chatCollection = [Chat]()
    
    init() {
        self.chatCollection = [
            Chat(id: UUID().uuidString, senderEmail: "sender1@example.com", receiverEmail: "receiver1@example.com", content: "Hello there!"),
            Chat(id: UUID().uuidString, senderEmail: "sender2@example.com", receiverEmail: "receiver2@example.com", content: "How's it going?"),
            Chat(id: UUID().uuidString, senderEmail: "sender3@example.com", receiverEmail: "receiver3@example.com", content: "Did you watch that movie?"),
            Chat(id: UUID().uuidString, senderEmail: "sender4@example.com", receiverEmail: "receiver4@example.com", content: "Remember our plan?"),
            Chat(id: UUID().uuidString, senderEmail: "sender5@example.com", receiverEmail: "receiver5@example.com", content: "I'll be there in 10 minutes."),
            Chat(id: UUID().uuidString, senderEmail: "sender6@example.com", receiverEmail: "receiver6@example.com", content: "What's for dinner?"),
            Chat(id: UUID().uuidString, senderEmail: "sender7@example.com", receiverEmail: "receiver7@example.com", content: "Just finished my workout."),
            Chat(id: UUID().uuidString, senderEmail: "sender8@example.com", receiverEmail: "receiver8@example.com", content: "Check out this cool website!"),
            Chat(id: UUID().uuidString, senderEmail: "sender9@example.com", receiverEmail: "receiver9@example.com", content: "Can you believe the weather today?"),
            Chat(id: UUID().uuidString, senderEmail: "sender10@example.com", receiverEmail: "receiver10@example.com", content: "Have a great day!"),
        ]
    }
}
