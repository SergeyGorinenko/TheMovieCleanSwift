//
//  MovieListProtocols.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import Basement

// MARK: - View Protocol

protocol MovieListViewProtocol: LoadingViewControllerProtocol {
}


// MARK: - View Delegate

protocol MovieListViewDelegate {
    func configureView()
}


// MARK: - Interactor Protocol

protocol MovieListInteractorProtocol {
    func loadFirstPage(completion: @escaping ((Result<Bool, Error>) -> Void))
    func loadNextPage(completion: @escaping ((Result<Bool, Error>) -> Void))
}


// MARK: - Router Protocol

protocol MovieListRouterProtocol: ViperRouterProtocol {
}
