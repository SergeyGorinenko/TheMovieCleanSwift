//
//  MovieListProtocols.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

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
}


// MARK: - Router Protocol

protocol MovieListRouterProtocol: ViperRouterProtocol {
}
