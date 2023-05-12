//
//  MovieListCell.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit
import Basement

class MovieListCell: ImageLoadingCell {
        
    static var defaultIdentifier: String = "movieListCellIdentifier"
    
    // MARK: - IBOutlet properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var progressView: CircleProgressView!

    // MARK: - Public properties
    
    // MARK: - Private properties

    private var _entityId = ""
    private var _clickBlock: ((String) -> Void)?

    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()

        _entityId = ""
        titleLabel.text = nil
        _clickBlock = nil
    }

    // MARK: - Private methods

}


// MARK: - GroupGalleryCellProtocol

extension MovieListCell: MovieListCellProtocol {

    var entityId: String {
        get {
            return _entityId
        }
        set {
            _entityId = newValue
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    var release: String? {
        get {
            return releaseLabel.text
        }
        set {
            releaseLabel.text = newValue
        }
    }

    var rating: Double? {
        get {
            return Double(ratingLabel.text ?? "0")
        }
        set {
            ratingLabel.text = String(format: "%0.1f", newValue ?? 0)
            progressView.progress = (newValue ?? 0) / 100
        }
    }

    var clickBlock: ((String) -> Void)? {
        get {
            return _clickBlock
        }
        set {
            _clickBlock = newValue
        }
    }

}


// MARK: - Actions

extension MovieListCell {
    
    @IBAction private func clickButtonAction(_ sender: Any) {
        clickBlock?(_entityId)
    }

}
