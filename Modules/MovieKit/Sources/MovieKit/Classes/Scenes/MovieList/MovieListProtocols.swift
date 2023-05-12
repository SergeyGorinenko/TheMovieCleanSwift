//
//  MovieListProtocols.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import UIKit
import Basement
import TheMovieAPI

// MARK: - View Protocol

protocol MovieListViewProtocol: LoadingViewControllerProtocol {
    var collectionView: UICollectionView { get }
    func reloadData()
}


// MARK: - View Delegate

protocol MovieListViewDelegate {
    func configureView()
}


// MARK: - Interactor Protocol

protocol MovieListInteractorProtocol {
    var movies: [Movie] { get }
    func loadFirstPage() async -> Result<[Movie], Error>
    func loadNextPage() async -> Result<[Movie], Error>
}


// MARK: - Router Protocol

protocol MovieListRouterProtocol: ViperRouterProtocol {
}


// MARK: - MovieListCellProtocol

protocol MovieListCellProtocol: ImageLoadingCellProtocol {
    var entityId: String { get set }
    var title: String? { get set }
    var release: String? { get set }
    var rating: Double? { get set }
    var clickBlock: ((String) -> Void)? { get set }
}
