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

public struct GetConfigurationImagesResponse: Codable {
    public var base_url: String
    public var secure_base_url: String
    public var backdrop_sizes: [String]
    public var logo_sizes: [String]
    public var poster_sizes: [String]
    public var profile_sizes: [String]
    public var still_sizes: [String]
}

public struct GetConfigurationResponse: Codable {
    public var images: GetConfigurationImagesResponse
}


// MARK: - GetConfigurationAPI

public extension TheMovieAPI {

    static func getConfiguration() async throws -> GetConfigurationResponse {
        let apiURL = URL(string: Configuration.baseURL.absoluteString + "/configuration?api_key=\(Configuration.themoviedbAPIKey)")!

        let (data, _) = try await URLSession.shared.data(from: apiURL)
//        let responseString = String(data: data, encoding: .utf8)
        if let decodedResponse = try? JSONDecoder().decode(GetConfigurationResponse.self, from: data) {
            return decodedResponse
        } else {
            throw TheMovieAPIError.parsing
        }
    }

}
