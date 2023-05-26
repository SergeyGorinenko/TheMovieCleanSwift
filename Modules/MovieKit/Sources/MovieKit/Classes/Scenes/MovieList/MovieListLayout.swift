//
//  MovieListLayout.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import UIKit

class MovieListLayout {

    // MARK: - Public properties

    static func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 10

        let resultLayout = UICollectionViewCompositionalLayout(section: section)
        return resultLayout
    }

    // MARK: - Private properties

    // MARK: - Public methods
    
    // MARK: - Private methods

}
