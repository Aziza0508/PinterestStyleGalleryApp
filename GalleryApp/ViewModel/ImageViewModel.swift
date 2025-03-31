//
//  ImageViewModel.swift
//  GalleryApp
//
//  Created by Aziza Gilash on 31.03.2025.
//

import Foundation
import SwiftUI

final class ImagesViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    private let imageFetchCount = 5

    func getImages() {
        var tempImages: [ImageModel] = []
        let group = DispatchGroup()

        for _ in 0..<imageFetchCount {
            group.enter()
            DispatchQueue.global(qos: .userInitiated).async {
                self.downloadImage { model in
                    if let model = model {
                        DispatchQueue.main.async {
                            tempImages.append(model)
                        }
                    }
                    group.leave()
                }
            }
        }

        group.notify(queue: .main) {
            self.images.append(contentsOf: tempImages)
        }
    }

    private func downloadImage(completion: @escaping (ImageModel?) -> Void) {
        let urlString = "https://picsum.photos/300/500"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Download error: \(error)")
                completion(nil)
                return
            }

            guard let data = data, let uiImage = UIImage(data: data) else {
                print("Failed to create UIImage")
                completion(nil)
                return
            }

            let image = Image(uiImage: uiImage)
            completion(ImageModel(image: image))
        }.resume()
    }
}
