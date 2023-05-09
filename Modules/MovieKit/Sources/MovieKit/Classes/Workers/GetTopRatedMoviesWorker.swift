//
//  GetCampaignsWorker.swift
//  Common
//
//  Created by sergey.gorinenko on 20.07.2021.
//  Copyright © 2021 PerformLive. All rights reserved.
//

import Combine
import TheMovieAPI

public final class GetTopRatedMoviesWorker {

    // MARK: - Public properties

    // MARK: - Private properties

    // MARK: - Public methods

    public class func getMovies(page: Int) -> AnyPublisher<Bool, Error> {
        TheMovieAPI.topRatedMovies(page: page)
            .flatMap { (result) -> AnyPublisher<Bool, Error> in
                return Result<Bool, Error>.Publisher(true).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    // MARK: - Private methods

}
