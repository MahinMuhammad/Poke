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
                            .frame(width: 60, height: 60)
                            .clipped()
                            .clipShape(Circle())
                    }placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .clipShape(Circle())

                    }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack(alignment: .leading){
                        Text(d.name)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text(chat.content)
                            .lineLimit(3)
                            .fontWeight(.regular)
                            .font(.system(size: 17))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text(d.time)
                            .foregroundColor(Color.gray)
                            .fontWeight(.thin)
                        
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(K.Colors.primaryColor))
                            .frame(width: 20, height: 20)
                            .overlay{
                                Text(d.numOfMessages)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color(K.Colors.canvasColor))
            }
            .listStyle(.plain)
            .navigationTitle("Messages")
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
