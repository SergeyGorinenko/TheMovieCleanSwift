//
//  TheMovieAPI.swift
//  TheMovieAPI
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Combine
import Foundation
import Alamofire
import SwiftyJSON
import Basement

// MARK: - TheMovieAPI

open class TheMovieAPI {
    
    public static func requestAPI<Parameters: Encodable>(apiURL: URL, method: HTTPMethod, parameters: Parameters? = nil) -> AnyPublisher<JSON, Error> {
        Future<JSON, Error> { (promise) in
            var encoder: ParameterEncoder!
            if method == .get {
                let literalEncoder = URLEncodedFormEncoder(boolEncoding: .literal)
                encoder = URLEncodedFormParameterEncoder(encoder: literalEncoder)
            } else {
                encoder = JSONParameterEncoder.default
            }

            let url = URL(string: apiURL.absoluteString)!

            if Configuration.isDebug {
                print("APIURL[\(method)]: \(url)")
                print("REQUEST[PARAMS]: \(String(describing: parameters))")
            }

            AF.request(url, method: method, parameters: parameters, encoder: encoder).validate().responseData { (response) in
                if let error = response.error {
                    promise(.failure(TheMovieAPIError.server(error)))
                } else if let responseData = response.data {
                    if let jsonRep = try? JSON(data: responseData) {
                        if Configuration.isDebug {
                            print("APIURL[\(method)]: \(url)")
                            print("RESPONSE[JSON]: \(jsonRep)")
                        }
                        promise(.success(jsonRep))
                    } else {
                        if Configuration.isDebug {
                            print("APIURL[\(method)]: \(url)")
                            let responseString = String(data: responseData, encoding: .utf8)
                            print("RESPONSE[RAW]: \(String(describing: responseString))")
                        }
                        promise(.failure(TheMovieAPIError.parsing))
                    }
                } else {
                    promise(.failure(TheMovieAPIError.undefined))
                }
            }
        }.eraseToAnyPublisher()
    }

}
