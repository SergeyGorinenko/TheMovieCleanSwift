//
//  ImageLoader.swift
//  
//
//  Created by Serhii Horinenko on 25.05.2023.
//

import UIKit

class ImageLoader: ImageLoaderProtocol {

    // MARK: - Public properties

    // MARK: - Private properties

    // MARK: - Public methods

    func getImage(url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let image = UIImage(data: data) {
            return image
        } else {
            throw URLError(.badURL)
        }
    }

    // MARK: - Private methods

}
