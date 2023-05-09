//
//  TheMovieAPIError.swift
//  TheMovieAPI
//
//  Created by Serhii Horinenko on 12.04.2023.
//

import Foundation

// MARK: - TheMovieAPIError

public enum TheMovieAPIError: Error {

    case undefined
    case server(Error)
    case parsing

    public static let Domain = "NetworkAPIError"

    fileprivate enum Code: Int {
        case undefined = -1
        case server = -2
        case parsing = -3
    }

    public var code: Int {
        switch self {
        case .undefined:
            return Code.undefined.rawValue
        case .server(let error):
            return (error as NSError).code
        case .parsing:
            return Code.parsing.rawValue
        }
    }

    public var localizedDescription: String {
        switch self {
        case .undefined:
            return "Undefined error"
        case .server(let error):
            return error.localizedDescription
        case .parsing:
            return "Could not parse data received from the server"
        }
    }

}
