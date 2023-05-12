//
//  MovieListInteractor.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import TheMovieAPI

// MARK: - MovieListInteractor

class MovieListInteractor {
    
    // MARK: - Public properties

    // MARK: - Private properties

    public var baseImageUrl = ""
    public var imageSizes = [String]()
    public var posterSize: String {
        let index = imageSizes.count / 2
        return (index < imageSizes.count) ? imageSizes[index] : ""
    }
    private var moviesStore = [Movie]()
    private var totalPages = UInt(0)
    private var totalMovies = UInt(0)
    private var currPage = UInt(1)

    // MARK: - Public methods

    // MARK: - Private methods

    private func loadPage(_ number: UInt) async -> Result<[Movie], Error> {
        print("")
        do {
            let response = try await TheMovieAPI.getTopRatedMovies(page: number)
            let baseImageUrl = self.baseImageUrl + posterSize
            let movies = response.results.map({ Movie.movie($0, baseImageUrl: baseImageUrl) })

            await MainActor.run {
                totalPages = response.total_pages
                totalMovies = response.total_results
                currPage = response.page
                moviesStore += movies
            }
            return .success(movies)
        } catch {
            return .failure(error)
        }
    }

    private func loadConfiguration() async -> Result<Bool, Error> {
        do {
            let response = try await TheMovieAPI.getConfiguration()
            await MainActor.run {
                baseImageUrl = response.images.base_url.replacingOccurrences(of: "http://", with: "https://")
                imageSizes = response.images.poster_sizes
            }
            return .success(true)
        } catch {
            return .failure(error)
        }
    }

}


// MARK: - MovieListInteractorProtocol

extension MovieListInteractor: MovieListInteractorProtocol {

    var movies: [Movie] {
        moviesStore
    }

    @MainActor
    func loadFirstPage() async -> Result<[Movie], Error> {
        async let configuration = loadConfiguration()
        async let movies = loadPage(1)
        let result = await (configuration, movies)
        return result.1
    }

    @MainActor
    func loadNextPage() async -> Result<[Movie], Error> {
        let nextPage = (currPage < totalPages) ? (currPage + 1) : totalPages
        return await loadPage(nextPage)
    }
    
}
