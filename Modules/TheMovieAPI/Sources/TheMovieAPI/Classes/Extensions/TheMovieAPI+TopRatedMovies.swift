//
//  GetMoviesAPI.swift
//  Template
//
//  Created by SergeyGorinenko on 05.01.2021.
//  Copyright © 2021 PerformLive. All rights reserved.
//

import Combine
import Foundation
import Basement
import SwiftyJSON

// MARK: - GetTopRatedMoviesAPIParams

class GetTopRatedMoviesAPIParams: TheMovieAPIParams {
    var page: Int

    init(page: Int) {
        self.page = page
    }
}


// MARK: - TheMovieAPI.topRatedMovies

public extension TheMovieAPI {

    static func topRatedMovies(page: Int) -> AnyPublisher<JSON, Error> {
        let apiURL = URL(string: Configuration.baseURL.absoluteString + "/movie/top_rated")!
        let parameters = GetTopRatedMoviesAPIParams(page: page)
        return requestAPI(apiURL: apiURL, method: .get, parameters: parameters)
    }

}
