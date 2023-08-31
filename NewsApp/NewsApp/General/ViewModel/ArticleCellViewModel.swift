//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Vermut xxx on 25.08.2023.
//

import UIKit

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    let imageUrl: String
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.date
        imageUrl = article.urlToImage
    }
}
