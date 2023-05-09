//
//  RootNavigationPresenter.swift
//  RootNavigation
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import Foundation

class RootNavigationPresenter {

    private enum Constants {
        static let fakedNetworkRequestTimeout = TimeInterval(3)
    }

    // MARK: - Public properties

    weak var view: RootNavigationViewProtocol?
    var interactor: RootNavigationInteractorProtocol!
    var router: RootNavigationRouterProtocol!

    // MARK: - Private properties

    private func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.fakedNetworkRequestTimeout) {
            self.showMovies(animated: true)
        }
    }

    private func showMovies(animated: Bool) {
        router.presentMovies(animated: animated) { (result) in }
    }

    // MARK: - Public methods

    // MARK: - Private methods

}


// MARK: - RootNavigationViewDelegate

extension RootNavigationPresenter: RootNavigationViewDelegate {

    func configureView() {
        refreshData()
    }

}
