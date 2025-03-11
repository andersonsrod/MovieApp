//
//  Utils.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import Foundation

public enum Errors: Error, LocalizedError {
    case noDataFound
    case decodeFail
}

struct Utils {
    
    static func getSampleJSonData() throws -> [Show] {
        if let completePath = Bundle.main.path(forResource: "ShowSample", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: completePath), options: .mappedIfSafe)
                let model = try JSONDecoder().decode([Show].self, from: data)
                return model
            } catch {
                print("Error initializing model")
                throw Errors.decodeFail
            }
        }
        
        throw Errors.noDataFound
    }
    
}
