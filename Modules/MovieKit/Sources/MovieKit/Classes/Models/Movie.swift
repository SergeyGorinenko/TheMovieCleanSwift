//
//  Movie.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

// MARK: - Movie

public struct Movie: Hashable {
    public let id: UInt
    public var voteAverage: Double?
    public var releaseDate: String?
    public var posterPath: String?
    public var originalTitle: String?
    public var title: String?
}
