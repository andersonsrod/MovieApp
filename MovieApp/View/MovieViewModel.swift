//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI

final class MovieViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var shows: [Show] = []
    @Published var showBackoTopButton = false
    
    var currentPage: Int = 1
    var reachedLastPage = false
    
    var hasNoData: Bool {
        shows.isEmpty
    }
    
    private let service: ShowsService
    
    init(service: ShowsService) {
        self.service = service
    }
    
    @MainActor
    func load(loadMore: Bool = false) async {
        defer {
            isLoading = false
        }
        
        do {
            if loadMore {
                guard !reachedLastPage else {
                    return
                }
                
                currentPage += 1
            } else {
                currentPage = 1
                reachedLastPage = false
            }

            isLoading = true
            
            let shows = try await self.service.fecthShows(page: currentPage)
            
            if loadMore {
                self.shows.append(contentsOf: shows)
            } else {
                self.shows = shows
            }
        } catch {
            switch error {
            case NetworkError.notFound:
                reachedLastPage = true
            default:
                print("Error: \(error)")
            }
        }
    }
    
}

