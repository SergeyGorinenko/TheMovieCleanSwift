//
//  MovieListCellViewModel.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import UIKit

class MovieListCellViewModel: ObservableObject {

    // MARK: - Public properties

    @Published var title: String?
    @Published var release: String?
    @Published var rating: String?
    @Published var image: UIImage? = nil

    private(set) var movie: Movie

    // MARK: - Private properties

    private let loader: ImageLoaderProtocol
    private var loadTask: Task<(), Never>?

    // MARK: - Public methods

    init(movie: Movie, loader: ImageLoaderProtocol) {
        self.movie = movie
        self.loader = loader
    }

    deinit {
        loadTask?.cancel()
    }

    func loadData(completion: @escaping (_ error: Error?) -> ()) {
        title = movie.title ?? ""
        release = movie.releaseDate ?? ""
        rating = String(format: "%0.1f", movie.voteAverage ?? 0)

        guard let urlString = movie.posterPath, let url = URL(string: urlString) else { return }

        loadTask = Task {
            if let image = try? await loader.getImage(url: url) {
                do {
                    try Task.checkCancellation()
                    await MainActor.run {
                        self.image = image
                        completion(nil)
                    }
                } catch {
                    await MainActor.run {
                        completion(error)
                    }
                }
            } else {
                await MainActor.run {
                    completion(URLError(.badURL))
                }
            }
        }
    }

    // MARK: - Private methods

}
