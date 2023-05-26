//
//  ImageLoadingCell.swift
//  Basement
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit

// MARK: - ImageLoadingCellProtocol

public protocol ImageLoadingCellProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}


// MARK: - ImageLoadingCell

open class ImageLoadingCell: UICollectionViewCell {
 
    private enum Constants {
        static let showHideDuration = 0.2
    }
    
    // MARK: - IBOutlet properties

    @IBOutlet public weak var imageView: UIImageView!

    // MARK: - Public properties

    // MARK: - Private properties

    private var activityView: ActivitySpinnerView?
    
    // MARK: - Public methods

    open override func awakeFromNib() {
        super.awakeFromNib()
        addActivityViewIfNeeded()
        hideLoading()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()

        addActivityViewIfNeeded()
        hideLoading()
        imageView.image = nil
    }

    // MARK: - Private methods

    private func addActivityViewIfNeeded() {
        if activityView == nil {
            let resultSpinner = ActivitySpinnerView()
            resultSpinner.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(resultSpinner)

            resultSpinner.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
            resultSpinner.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
            resultSpinner.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.2).isActive = true
            
            activityView = resultSpinner
        }
    }

}


// MARK: - ImageLoadingCellProtocol

extension ImageLoadingCell: ImageLoadingCellProtocol {

    public func showLoading() {
        activityView?.startAnimating()
        activityView?.alpha = 1
    }

    public func hideLoading() {
        activityView?.alpha = 0
        activityView?.stopAnimating()
    }

}
