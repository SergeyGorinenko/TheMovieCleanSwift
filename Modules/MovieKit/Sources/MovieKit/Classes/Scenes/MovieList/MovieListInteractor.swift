//
//  MovieListInteractor.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine

// MARK: - MovieListInteractor

class MovieListInteractor {
    
    // MARK: - Public properties

    // MARK: - Private properties

    private var currPage = 0
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Public methods

    // MARK: - Private methods

    private func load(page: Int, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        GetTopRatedMoviesWorker.getMovies(page: page)
            .sink { (sinkCompletion) in
                switch sinkCompletion {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (result) in
                self?.currPage = page
                completion(.success(result))
            }.store(in: &cancellables)
    }

}


// MARK: - MovieListInteractorProtocol

extension MovieListInteractor: MovieListInteractorProtocol {
    
    func loadFirstPage(completion: @escaping ((Result<Bool, Error>) -> Void)) {
        load(page: 0, completion: completion)
    }

    func loadNextPage(completion: @escaping ((Result<Bool, Error>) -> Void)) {
        load(page: currPage + 1, completion: completion)
    }

}
