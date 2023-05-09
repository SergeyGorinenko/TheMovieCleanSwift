//
//  RootNavigationRouter.swift
//  RootNavigation
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit
import Basement
import MovieKit

class RootNavigationRouter: ViperRouter {

    private enum Constants {
        static let transitionDuration = TimeInterval(0.2)
    }

    // MARK: - Public properties

    // MARK: - Private properties

    // MARK: - Public methods

    // MARK: - Private methods

}


// MARK: - RootNavigationRouterProtocol

extension RootNavigationRouter: RootNavigationRouterProtocol {
    
    func presentMovies(animated: Bool, completion: @escaping ((Result<Any, Error>) -> Void)) {
        let controller = MovieListModule.build(completion: completion)
        let navController = viewController as! UINavigationController
        
        let transition = CATransition()
        transition.duration = Constants.transitionDuration
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        navController.view.layer.removeAllAnimations()
        navController.view.layer.add(transition, forKey: nil)
        
        navController.setViewControllers([controller], animated: false)
    }
    
}
