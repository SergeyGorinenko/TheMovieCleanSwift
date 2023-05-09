//
//  RootNavigationViewController.swift
//  RootNavigation
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit

class RootNavigationViewController: UINavigationController {

    // MARK: - IBOutlet properties

    // MARK: - Public properties

    var presenter: RootNavigationViewDelegate!

    // MARK: - Private properties

    // MARK: - Public methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureView()
    }
            
    // MARK: - Private methods

}


// MARK: - RootNavigationViewProtocol

extension RootNavigationViewController: RootNavigationViewProtocol {
}
