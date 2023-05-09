//
//  ViperRouter.swift
//  Basement
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import UIKit

// MARK: - ViperRouterProtocol

public protocol ViperRouterProtocol {
    func present(controller: UIViewController, completion: (() -> Void)?)
    func dismiss(completion: (() -> Void)?)
    func present(error: Error, completion: (() -> Void)?)
    func complete(result: Result<Any, Error>)
}


// MARK: - ViperRouter

open class ViperRouter: NSObject {

    private enum Constants {
        static let navHideControllersNumber = 2
        static let errorDomain = "com.module.viper.router"
        static let errorCode = -1
    }

    // MARK: - Public properties

    public weak var viewController: UIViewController?
    public var completion: ((Result<Any, Error>) -> Void)?

    // MARK: - Private properties

    // MARK: - Public methods

    // MARK: - Private methods

}


// MARK: - ViperRouterProtocol

extension ViperRouter: ViperRouterProtocol {

    public func present(controller: UIViewController, completion: (() -> Void)? = nil) {
        viewController?.present(controller, animated: true, completion: completion)
    }

    public func dismiss(completion: (() -> Void)? = nil) {
        viewController?.dismiss(animated: true, completion: completion)
    }

    @objc
    open func present(error: Error, completion: (() -> Void)? = nil) {
        var message = ""
        if let error = error as? CustomNSError {
            if let errorsRep = error.errorUserInfo["errors"] as? [[String: Any]] {
                errorsRep.forEach { (errorRep) in
                    if let errorRep = errorRep["error"] as? [String: Any] {
                        errorRep.values.forEach { (value) in
                            if message.count > 0 {
                                message = "\(message)\n\(value)"
                            } else {
                                message = "\(value)"
                            }
                        }
                    }
                }
            }
        }
        
        let alert = UIAlertController(title: error.localizedDescription, message: message, preferredStyle: .alert)
        let title = NSLocalizedString("Ok", comment: "ViperRouter: error alert action button title")
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            completion?()
        }))

        viewController?.present(alert, animated: true, completion: nil)
    }

    public func complete(result: Result<Any, Error>) {
        completion?(result)
    }

}
