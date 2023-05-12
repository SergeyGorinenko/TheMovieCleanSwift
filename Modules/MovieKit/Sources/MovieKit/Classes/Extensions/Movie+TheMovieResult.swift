//
//  Movie.swift
//  MovieKit
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import TheMovieAPI

// MARK: - Movie

public extension Movie {

    static func movie(_ theMovie: TheMovieResult) -> Movie {
        var resultMovie = Movie(id: theMovie.id)
        resultMovie.voteAverage = theMovie.vote_average
        resultMovie.releaseDate = theMovie.release_date
        resultMovie.posterPath = theMovie.poster_path
        resultMovie.originalTitle = theMovie.original_title
        resultMovie.title = theMovie.title
        return resultMovie
    }
    
}
