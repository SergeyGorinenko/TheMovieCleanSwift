//
//  LoadingViewController.swift
//  Basement
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit
import Lottie

// MARK: - LoadingViewControllerProtocol

public protocol LoadingViewControllerProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}


// MARK: - LoadingViewController

open class LoadingViewController: UIViewController {

    private enum Constants {
        static let loaderWidthRatio = CGFloat(1.0/3.0)
    }

    private var isLoadingShown = false

    private var _dimmingView: UIView?
    private var dimmingView: UIView {
        if _dimmingView == nil {
            let view = UIView(frame: view.bounds)
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            _dimmingView = view
        }
        return _dimmingView!
    }

    private var _animationView: AnimationView?
    private var animationView: AnimationView {
        if _animationView == nil {
            let bundle = Bundle.module
            let filePath = bundle.path(forResource: "loader", ofType: "json")
            let animationView = AnimationView(filePath: filePath!)
            animationView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.animationSpeed = 1
            _animationView = animationView
        }
        return _animationView!
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    deinit {
        print("DEINIT: \(self)")
    }

}


// MARK: - LoadingViewControllerProtocol

extension LoadingViewController: LoadingViewControllerProtocol {

    public func showLoading() {
        assert(Thread.isMainThread, "Must be run from the main thread")
        if !isLoadingShown {
            isLoadingShown = true

            animationView.translatesAutoresizingMaskIntoConstraints = false
            dimmingView.addSubview(animationView)
            dimmingView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerX, relatedBy: .equal, toItem: dimmingView, attribute: .centerX, multiplier: 1.0, constant: 0.0))
            dimmingView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerY, relatedBy: .equal, toItem: dimmingView, attribute: .centerY, multiplier: 1.0, constant: 0.0))

            dimmingView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dimmingView)

            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[dimmingView]-0-|", options: [], metrics: nil, views: ["dimmingView": dimmingView]))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[dimmingView]-0-|", options: [], metrics: nil, views: ["dimmingView": dimmingView]))

            view.bringSubviewToFront(dimmingView)
            animationView.play()
        }
    }
    
    public func hideLoading() {
        assert(Thread.isMainThread, "Must be run from the main thread")
        if isLoadingShown {
            animationView.stop()
            animationView.removeFromSuperview()
            dimmingView.removeFromSuperview()
            _animationView = nil
            _dimmingView = nil
            isLoadingShown = false
        }
    }

}
