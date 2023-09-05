//
//  TabBarViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 9/5/23.
//

import Foundation

final class TabBarViewModel:ObservableObject{
    
    @Published var selectedTab = Tabs.chatList
    
    enum Tabs{
        case chatList
        case friendList
        case settings
    }
}
