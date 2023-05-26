//
//  TheMovieResult.swift
//  TheMovieAPI
//
//  Created by Serhii Horinenko on 12.04.2023.
//

// MARK: - TheMovieResult

public struct TheMovieResult: Codable {
    public let popularity: Double
    public let vote_average: Double
    public let release_date: String
    public let backdrop_path: String
    public let poster_path: String
    public let original_language: String
    public let adult: Bool
    public let id: UInt
    public let original_title: String
    public let title: String
    public let genre_ids: [UInt]
    public let vote_count: UInt
    public let video: Bool
    public let overview: String
}
