//
//  MovieItemViewModelTests.swift
//  MovieAppTests
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import XCTest
@testable import MovieApp

final class MovieItemViewModelTests: XCTestCase {
    var shows: [Show]?
    
    override func setUp() {
        super.setUp()
        prepareData()
    }
    
    private func prepareData() {
        do {
            shows = try Utils.getSampleJSonData()
        } catch {
            print("Error initializing model")
        }
    }
    
    func testAttributes() throws {
        guard let show = shows?.first else {
            XCTFail("No show to test MovieItemViewModel")
            return
        }
        
        let viewModel = MovieItemViewModel(show: show)

        // Then
        XCTAssertEqual(viewModel.name, "Under the Dome")

        XCTAssertEqual(viewModel.image, URL.init(string: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")!)
        
        XCTAssertEqual(viewModel.genres, "Drama, Science-Fiction, Thriller")
    }
}
