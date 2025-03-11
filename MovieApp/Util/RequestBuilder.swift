//
//  RequestBuilder.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

public typealias Parameters = [String : Any]

struct RequestBuilder {
        
    static func buildRequest(path: String, urlParameters: Parameters) throws -> URL {
        guard var urlComponents = URLComponents(string: URL.baseURL) else {
            throw NetworkError.badRequest
        }
        urlComponents.path = path
        
        urlComponents.queryItems = urlParameters.map { key, value in
            URLQueryItem(name: key, value: value as? String)
        }

        guard let url = urlComponents.url else {
            throw NetworkError.badRequest
        }
        
        return url
    }
    
}
