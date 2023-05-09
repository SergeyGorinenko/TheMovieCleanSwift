//
//  ViewController.swift
//  TheMovieCleanSwift
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit
import RootNavigation

class ViewController: UIViewController {

    // MARK: - IBOutlet properties

    @IBOutlet private weak var appRootContainer: UIView!
    
    // MARK: - Public properties
    
    // MARK: - Private properties

    private var appRootController: UIViewController?

    // MARK: - Public methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let controller = RootNavigationModule.build { (result) in }
        addChild(controller)

        controller.view.translatesAutoresizingMaskIntoConstraints = false
        appRootContainer.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: appRootContainer.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: appRootContainer.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: appRootContainer.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: appRootContainer.bottomAnchor)
        ])

        controller.didMove(toParent: self)
        appRootController = controller
    }

}
