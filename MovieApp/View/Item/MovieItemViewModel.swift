//
//  MovieItemViewModel.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

final class MovieItemViewModel {
    var image: URL? {
        URL(string: self.show.image?.medium ?? "")
    }
    
    var name: String {
        show.name
    }
    
    var genres: String {
        show.genres.joined(separator: ", ")
    }
    
    private let show: Show
    
    init(show: Show) {
        self.show = show
    }
}
