//
//  MovieListPresenter.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

class MovieListPresenter {

    // MARK: - Public properties

    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol!
    var router: MovieListRouterProtocol!

    // MARK: - Private properties

    // MARK: - Public methods

    // MARK: - Private methods

}


// MARK: - MovieListViewDelegate

extension MovieListPresenter: MovieListViewDelegate {

    func configureView() {
        view?.showLoading()
        interactor.loadFirstPage { [weak self] (result) in
            self?.view?.hideLoading()
        }
    }
    
}
