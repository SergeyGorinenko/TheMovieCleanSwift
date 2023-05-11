//
//  TheMovieResult.swift
//  TheMovieAPI
//
//  Created by Serhii Horinenko on 12.04.2023.
//

// MARK: - TheMovieResult

public struct TheMovieResult: Codable {
    public var popularity: Double
    public var vote_average: Double
    public var release_date: String
    public var backdrop_path: String
    public var poster_path: String
    public var original_language: String
    public var adult: Bool
    public var id: UInt
    public var original_title: String
    public var title: String
    public var genre_ids: [UInt]
    public var vote_count: UInt
    public var video: Bool
    public var overview: String
}
