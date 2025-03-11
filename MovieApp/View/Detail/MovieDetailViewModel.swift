//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

final class MovieDetailViewModel {
    var name: String {
        show.name
    }
    
    var image: URL? {
        URL(string: show.image?.medium ?? "")
    }
    
    var runTime: String {
        "\(show.runtime ?? 0) min"
    }
    
    var summary: String? {
        show.summary?.withoutHtml
    }
    
    var time: String {
        show.schedule.time
    }
    
    var days: [String] {
        show.schedule.days
    }
    
    private let show: Show
    
    init(show: Show) {
        self.show = show
    }
}
