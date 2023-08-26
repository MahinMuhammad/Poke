//
//  ChatBoxView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct ChatBoxView: View {
    @EnvironmentObject var router: Router
    
    @ObservedObject var viewModel: ChatBoxViewModel
    
    init(sending:String, receiving:String){
        self.viewModel = ChatBoxViewModel(senderEmail: sending, receiverEmail: receiving)
    }
    var body: some View {
        Text(String(router.path.count))
    }
}

struct ChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView(sending: "", receiving: "")
    }
}
