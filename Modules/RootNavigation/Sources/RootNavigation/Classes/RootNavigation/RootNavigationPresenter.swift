//
//  RootNavigationPresenter.swift
//  RootNavigation
//
//  Created by Serhii Horinenko on 12.04.2023.
//

class RootNavigationPresenter {

    // MARK: - Public properties

    weak var view: RootNavigationViewProtocol?
    var interactor: RootNavigationInteractorProtocol!
    var router: RootNavigationRouterProtocol!

    // MARK: - Private properties

    // MARK: - Public methods

    // MARK: - Private methods

}


// MARK: - RootNavigationViewDelegate

extension RootNavigationPresenter: RootNavigationViewDelegate {

    func configureView() {
    }

}
