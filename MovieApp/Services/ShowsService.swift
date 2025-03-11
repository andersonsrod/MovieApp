//
//  ShowsService.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

protocol ShowsService {
    func fecthShows(page: Int) async throws -> [Show]
}

struct RemoteShowService: ShowsService {

    enum Path: String {
        case shows = "/shows"
    }
    
    func fecthShows(page: Int) async throws -> [Show] {
        let urlParameters = ["page" : String(page)]
        
        let url = try RequestBuilder.buildRequest(path: Path.shows.rawValue,
                                                  urlParameters: urlParameters)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let fetchedData = try JSONDecoder().decode([Show].self, from: try mapResponse(response: (data, response)))
        
        return fetchedData
    }
    
}
