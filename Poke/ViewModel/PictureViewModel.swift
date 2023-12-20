//
//  PictureViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 12/20/23.
//

import Foundation

final class PictureViewModel:ObservableObject{
    let imageUrl:URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
}
