//
//  MovieListViewController.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Basement
import UIKit

class MovieListViewController: LoadingViewController {

    // MARK: - IBOutlet properties

    @IBOutlet private weak var _collectionView: UICollectionView!

    // MARK: - Public properties

    var presenter: MovieListViewDelegate!

    // MARK: - Private properties

    // MARK: - Public methods

    override func viewDidLoad() {
        super.viewDidLoad()
        _collectionView.collectionViewLayout = MovieListLayout.layout()

        presenter.configureView()
    }
            
    // MARK: - Private methods

}


// MARK: - UICollectionViewDelegate

extension MovieListViewController: UICollectionViewDelegate {
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}


// MARK: - MovieListViewProtocol

extension MovieListViewController: MovieListViewProtocol {

    var collectionView: UICollectionView {
        _collectionView
    }

    func reloadData() {
    }

}
