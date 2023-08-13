//
//  ChatListView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    @StateObject var d = Dummy()
    var body: some View {
        ZStack {
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            List(viewModel.chatCollection){ chat in
                HStack(alignment: .top){
                    AsyncImage(url: d.propic){  image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color(K.Colors.canvasColor))
            }
            .listStyle(.plain)
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}


class Dummy:ObservableObject{
    @Published let propic:URL? = URL(string: "https://picsum.photos/200")
}
