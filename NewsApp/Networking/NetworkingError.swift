//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Vermut xxx on 26.08.2023.
//

import UIKit

enum NetworkingError: Error {
case NetworkingError(_ error: Error)
case unknown
}
