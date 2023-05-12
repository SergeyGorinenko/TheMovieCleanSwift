//
//  ImageLoadingCell.swift
//  Common
//
//  Created by sergey.gorinenko on 27.01.2021.
//  Copyright © 2021 PerformLive. All rights reserved.
//

import UIKit

// MARK: - ActivitySpinnerViewProtocol

public protocol ActivitySpinnerViewProtocol: UIView {
    func startAnimating()
    func stopAnimating()
}


// MARK: - ActivitySpinnerView

open class ActivitySpinnerView: UIView {
 
    private enum Constants {
        static let cornerRadius = CGFloat(6)
        static let backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.3137254902, blue: 0.3137254902, alpha: 0.65)
    }
    
    // MARK: - IBOutlet properties

    // MARK: - Public properties

    // MARK: - Private properties

    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Public methods

    public init() {
        super.init(frame: CGRect.zero)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Private methods

    private func configure() {
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
        backgroundColor = Constants.backgroundColor

        let ratioConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        addConstraint(ratioConstraint)

        clipsToBounds = false
        addActivityView()
    }
    
    private func addActivityView() {
        let resultIndicator = UIActivityIndicatorView(style: .medium)
        resultIndicator.hidesWhenStopped = false
        resultIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultIndicator)
        
        resultIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resultIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        activityIndicator = resultIndicator
    }

}


// MARK: - ActivitySpinnerViewProtocol

extension ActivitySpinnerView: ActivitySpinnerViewProtocol {

    public func startAnimating() {
        activityIndicator?.startAnimating()
    }
    
    public func stopAnimating() {
        activityIndicator?.stopAnimating()
    }
    
}
