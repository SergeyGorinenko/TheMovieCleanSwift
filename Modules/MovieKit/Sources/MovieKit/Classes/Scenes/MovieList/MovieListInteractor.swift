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

    private var moviesStore = [Movie]()
    private var totalPages = UInt(0)
    private var totalMovies = UInt(0)
    private var currPage = UInt(1)

    // MARK: - Public methods

    // MARK: - Private methods

    @MainActor
    private func loadPage(_ number: UInt) async -> Result<[Movie], Error> {
        print("")
        do {
            let response = try await TheMovieAPI.getTopRatedMovies(page: number)
            totalPages = response.total_pages
            totalMovies = response.total_results
            currPage = response.page
            let movies = response.results.map({ Movie.movie($0) })
            self.moviesStore += movies
            return .success(movies)
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

    func loadFirstPage() async -> Result<[Movie], Error> {
        return await loadPage(1)
    }

    func loadNextPage() async -> Result<[Movie], Error> {
        let nextPage = (currPage < totalPages) ? (currPage + 1) : totalPages
        return await loadPage(nextPage)
    }
    
}
