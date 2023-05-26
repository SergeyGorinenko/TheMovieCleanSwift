//
//  MovieListCell.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
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

    private var cancellables = Set<AnyCancellable>()

    private var _clickBlock: ((UInt) -> Void)?
    private var viewModel: MovieListCellViewModel? {
        didSet {
            viewModel?.$title
                .removeDuplicates()
                .assign(to: \.text, on: titleLabel)
                .store(in: &cancellables)

            viewModel?.$release
                .removeDuplicates()
                .assign(to: \.text, on: releaseLabel)
                .store(in: &cancellables)

            viewModel?.$rating
                .removeDuplicates()
                .assign(to: \.text, on: ratingLabel)
                .store(in: &cancellables)

            viewModel?.$image
                .removeDuplicates()
                .assign(to: \.image, on: imageView)
                .store(in: &cancellables)
        }
    }

    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        releaseLabel.text = nil
        ratingLabel.text = nil
        progressView.progress = 0
        _clickBlock = nil
        viewModel = nil
    }

    // MARK: - Private methods

    private func cleanCancellables() {
        cancellables.forEach { (item) in
            item.cancel()
        }
        cancellables.removeAll()
    }

}


// MARK: - GroupGalleryCellProtocol

extension MovieListCell: MovieListCellProtocol {

    var clickBlock: ((UInt) -> Void)? {
        get {
            return _clickBlock
        }
        set {
            _clickBlock = newValue
        }
    }

    func update(with movie: Movie, loader: ImageLoaderProtocol) {
        cleanCancellables()
        viewModel = MovieListCellViewModel(movie: movie, loader: loader)

        showLoading()
        viewModel?.loadData(completion: { [weak self] (error) in
            self?.hideLoading()
        })
    }

}


// MARK: - Actions

extension MovieListCell {
    
    @IBAction private func clickButtonAction(_ sender: Any) {
        if let movieId = viewModel?.movie.id {
            clickBlock?(movieId)
        }
    }

}
