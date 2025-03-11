//
//  Show.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

struct Show: Decodable, Hashable {
    let id: Int
    let name: String
    let image: Image?
    var summary: String?
    let genres: [String]
    let runtime: Int?
    let schedule: Schedule
    
    struct Schedule: Decodable, Hashable {
        let time: String
        let days: [String]
    }
}
