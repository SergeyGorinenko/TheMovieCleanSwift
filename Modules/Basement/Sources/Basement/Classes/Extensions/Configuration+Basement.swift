//
//  Configuration+GroupProfile.swift
//  Newstube
//
//  Created by SergeyGorinenko on 18.12.2020.
//  Copyright © 2020 SergeysGroup. All rights reserved.
//

extension Configuration {

    public static var isDebug: Bool {
        return try! Bool(Configuration.value(for: "DEBUG"))!
    }

}
