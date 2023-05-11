//
//  TheMovieAPI+GetTopRatedMovies.swift
//  TheMovieAPI
//
//  Created by SergeyGorinenko on 05.01.2021.
//  Copyright © 2021 PerformLive. All rights reserved.
//

import Foundation
import Basement

// MARK: - GetTopRatedMoviesResponse

public struct GetTopRatedMoviesResponse: Codable {
    public var results: [TheMovieResult]
    public var total_pages: UInt
    public var total_results: UInt
    public var page: UInt
}


// MARK: - GetTopRatedMoviesAPI

public extension TheMovieAPI {

    static func getTopRatedMovies(page: UInt) async throws -> GetTopRatedMoviesResponse {
        let apiURL = URL(string: Configuration.baseURL.absoluteString + "/movie/top_rated?page=\(page)&api_key=\(Configuration.themoviedbAPIKey)")!

        let (data, _) = try await URLSession.shared.data(from: apiURL)
        if let decodedResponse = try? JSONDecoder().decode(GetTopRatedMoviesResponse.self, from: data) {
            return decodedResponse
        } else {
            throw TheMovieAPIError.parsing
        }
    }

}
