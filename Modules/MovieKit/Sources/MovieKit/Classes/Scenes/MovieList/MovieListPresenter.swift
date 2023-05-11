//
//  MovieListPresenter.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Foundation

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
        Task {
            let result = await interactor.loadFirstPage()
            await MainActor.run {
                view?.showLoading()
                switch result {
                case .success(_):
                    view?.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
