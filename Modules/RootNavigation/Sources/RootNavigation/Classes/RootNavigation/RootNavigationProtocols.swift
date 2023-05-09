//
//  RootNavigationProtocols.swift
//  RootNavigation
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Basement

// MARK: - View Protocol

protocol RootNavigationViewProtocol: AnyObject {
}


// MARK: - View Delegate

protocol RootNavigationViewDelegate {
    func configureView()
}


// MARK: - Interactor Protocol

protocol RootNavigationInteractorProtocol {
}


// MARK: - Router Protocol

protocol RootNavigationRouterProtocol: ViperRouterProtocol {
    func presentMovies(animated: Bool, completion: @escaping ((Result<Any, Error>) -> Void))
}
