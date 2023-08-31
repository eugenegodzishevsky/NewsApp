//
//  ApiManager.swift
//  NewsApp
//
//  Created by Vermut xxx on 26.08.2023.
//

import Foundation

final class ApiManager {
    private static let apiKey = "1abe6edb57c843469c23ce69e02d9eff"
    private static let baseUrl = "http://newsapi.org/v2/"
    private static let path = "everything"
    
    //Create url path  and make request
    static func getNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string:  stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
        }
        
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completion(.success(data))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
        
        session.resume()
    }
    
    //Handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetworkingError.NetworkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                
                completion(.success(model.articles))
            }
            
            catch let decodeError {
                completion(.failure(decodeError))
            }
            
        } else {
            completion(.failure(NetworkingError.unknown))
        }
        
    }
}
