//
//  Configuration+GroupProfile.swift
//  Newstube
//
//  Created by SergeyGorinenko on 18.12.2020.
//  Copyright © 2020 SergeysGroup. All rights reserved.
//

import Foundation
import Basement

extension Configuration {

    public static var baseURL: URL {
        return try! URL(string: Configuration.value(for: "API_ENDPOINT"))!
    }

    public static var themoviedbAPIKey: String {
        return try! String(stringLiteral: Configuration.value(for: "THEMOVIEDB_API_KEY"))
    }

}
