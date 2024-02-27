//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Jeann Luiz on 27/02/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString uriString: String) {
        NetworkManager.shared.downloadImage(fromURLString: uriString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image (uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable ()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    var body: some View {
        RemoteImage (image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
