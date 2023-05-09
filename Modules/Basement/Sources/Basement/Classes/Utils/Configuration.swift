//
//  Configuration.swift
//  Newstube
//
//  Created by SergeyGorinenko on 18.12.2020.
//  Copyright © 2020 SergeysGroup. All rights reserved.
//

import Foundation

public class Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    public static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
