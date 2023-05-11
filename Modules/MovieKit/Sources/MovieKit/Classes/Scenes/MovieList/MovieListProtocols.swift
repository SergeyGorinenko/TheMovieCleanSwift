//
//  MovieListProtocols.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import Basement
import TheMovieAPI

// MARK: - View Protocol

protocol MovieListViewProtocol: LoadingViewControllerProtocol {
    func reloadData()
}


// MARK: - View Delegate

protocol MovieListViewDelegate {
    func configureView()
}


// MARK: - Interactor Protocol

protocol MovieListInteractorProtocol {
    func loadFirstPage() async -> Result<[TheMovieResult], Error>
    func loadNextPage() async -> Result<[TheMovieResult], Error>
}


// MARK: - Router Protocol

protocol MovieListRouterProtocol: ViperRouterProtocol {
}
