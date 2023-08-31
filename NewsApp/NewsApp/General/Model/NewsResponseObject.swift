//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Vermut xxx on 24.08.2023.
//

import UIKit

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
