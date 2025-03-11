//
//  MockShowService.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

final class MockShowService: ShowsService {
    func fecthShows(page: Int) async throws -> [Show] {
        do {
            let model = try Utils.getSampleJSonData()
            return model
        } catch {
            print("Error initializing model")
        }
        
        return []
    }
}
