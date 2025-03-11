//
//  MovieDetailViewModelTests.swift
//  MovieAppTests
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import XCTest
@testable import MovieApp

final class MovieDetailViewModelTests: XCTestCase {
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
            XCTFail("No show to test MovieDetailViewModel")
            return
        }
        
        let viewModel = MovieDetailViewModel(show: show)

        // Then
        XCTAssertEqual(viewModel.name, "Under the Dome")

        XCTAssertEqual(viewModel.image, URL.init(string: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")!)
        
        XCTAssertEqual(viewModel.runTime, "60 min")
        
        XCTAssertEqual(viewModel.summary, "Under the Dome is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.\n")
        
        XCTAssertEqual(viewModel.time, "22:00")
        
        XCTAssertEqual(viewModel.days.first, "Thursday")
    }
}
