//
//  PictureView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 12/20/23.
//

import SwiftUI

struct PictureView: View {
    @StateObject var viewModel: PictureViewModel
    var body: some View {
        AsyncImage(url: viewModel.imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
        }

    }
}

#Preview {
    PictureView(viewModel: PictureViewModel(imageUrl: URL(string: "")))
}
