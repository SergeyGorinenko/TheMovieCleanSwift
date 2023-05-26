//
//  File.swift
//  
//
//  Created by Serhii Horinenko on 25.05.2023.
//

import Combine
import UIKit

protocol ImageLoaderProtocol {

    func getImage(url: URL) async throws -> UIImage

}
