//
//  ContactListViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 12/21/23.
//

import Foundation

final class ContactListViewModel:ObservableObject{
    @Published var searchBarInput:String = ""
    @Published var contactList:[String] = []
}
