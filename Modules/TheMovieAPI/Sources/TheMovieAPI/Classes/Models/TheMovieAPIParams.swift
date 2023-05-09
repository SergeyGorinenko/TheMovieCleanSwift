//
//  GetMoviesAPI.swift
//  TheMovieAPI
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Basement

// MARK: - TheMovieAPIParams

class TheMovieAPIParams: Encodable {
    let api_key = Configuration.themoviedbAPIKey
}
