//
//  RemoteImageView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//


import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        ImageNetwork.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(Assets.coffeePlaceholder).resizable()
    }
}


struct RemoteImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}
