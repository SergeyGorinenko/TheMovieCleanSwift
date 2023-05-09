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

    // MARK: - Public properties

    var presenter: MovieListViewDelegate!

    // MARK: - Private properties

    // MARK: - Public methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureView()
    }
            
    // MARK: - Private methods

}


// MARK: - MovieListViewProtocol

extension MovieListViewController: MovieListViewProtocol {
}
