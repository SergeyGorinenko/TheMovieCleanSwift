//
//  ImageLoadingCell.swift
//  Basement
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit
import SDWebImage

// MARK: - ImageLoadingCellProtocol

public protocol ImageLoadingCellProtocol: AnyObject {
    var image: UIImage? { get set }
    func setImageWith(url: URL?, placeholderImage: UIImage?)
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
    private var _imageURL: URL?
    
    // MARK: - Public methods

    open override func awakeFromNib() {
        super.awakeFromNib()
        addActivityViewIfNeeded()
        hideActivityView(animated: false)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()

        addActivityViewIfNeeded()
        hideActivityView(animated: false)
        imageView.image = nil
        _imageURL = nil
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
    
    private func showActivityView(animated: Bool) {
        activityView?.startAnimating()
        activityView?.alpha = 1
    }

    private func hideActivityView(animated: Bool) {
        activityView?.alpha = 0
        activityView?.stopAnimating()
    }

}


// MARK: - ImageLoadingCellProtocol

extension ImageLoadingCell: ImageLoadingCellProtocol {

    public var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.sd_cancelCurrentImageLoad()
            imageView.image = newValue
        }
    }
    
    public func setImageWith(url: URL?, placeholderImage: UIImage?) {
        showActivityView(animated: true)
        imageView?.sd_setImage(with: url, placeholderImage: placeholderImage,completed: { [weak self] (image, error, cache, url) in
            self?.hideActivityView(animated: true)
        })
    }

}
