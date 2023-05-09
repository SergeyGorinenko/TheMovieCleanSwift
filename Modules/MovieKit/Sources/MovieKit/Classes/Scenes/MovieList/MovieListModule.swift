//
//  MovieListModule.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit

public final class MovieListModule {

    public static func build(completion: @escaping ((Result<Any, Error>) -> Void)) -> UIViewController {

        let storyboard = UIStoryboard(name: "MovieKit", bundle: Bundle.module)
        let view = storyboard.instantiateViewController(withIdentifier: "movieListStoryboardIdentifier") as! MovieListViewController

        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        
        router.viewController = view
        router.completion = completion
        
        return view
    }
}
