//
//  ArticleResponseObject.swift
//  NewsApp
//
//  Created by Vermut xxx on 24.08.2023.
//

import UIKit

struct ArticleResponseObject: Codable {
    let title: String
    let description: String
    let urlToImage: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
