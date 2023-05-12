//
//  MovieListPresenter.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Foundation
import UIKit

class MovieListPresenter {

    private enum Section: Hashable {
        case main
    }

    // MARK: - Public properties

    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol!
    var router: MovieListRouterProtocol!

    // MARK: - Private properties

    private var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!

    // MARK: - Public methods

    // MARK: - Private methods

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: view!.collectionView, cellProvider: { [weak self] (collectionView, indexPath, movie) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.defaultIdentifier, for: indexPath) as! MovieListCell
            self?.configure(cell: cell, with: indexPath, movie: movie)
            return cell
        })
    }

    private func configure(cell: MovieListCell, with indexPath: IndexPath, movie: Movie) {
        cell.entityId = "\(movie.id)"
        cell.title = movie.title
        cell.release = movie.releaseDate
        cell.rating = movie.voteAverage
    }

    private func applySnaphot(movies: [Movie]) {
        snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}


// MARK: - MovieListViewDelegate

extension MovieListPresenter: MovieListViewDelegate {

    func configureView() {
        configureDataSource()
        
        view?.showLoading()
        Task {
            let result = await interactor.loadFirstPage()
            await MainActor.run {
                view?.hideLoading()
                switch result {
                case .success(let movies):
                    applySnaphot(movies: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
