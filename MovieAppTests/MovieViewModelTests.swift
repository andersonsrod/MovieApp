//
//  MovieViewModelTests.swift
//  MovieAppTests
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import XCTest
@testable import MovieApp

final class MovieViewModelTests: XCTestCase {
    let viewModel = MovieViewModel(service: MockShowService())
    
    func testLoad() throws {
        let promise = expectation(description: "Load")
        
        XCTAssertTrue(viewModel.hasNoData)
        XCTAssertFalse(viewModel.showHasNoDataText)
        
        Task {
            await viewModel.load()
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertFalse(viewModel.shows!.isEmpty)
        XCTAssertFalse(viewModel.hasNoData)
        XCTAssertFalse(viewModel.showHasNoDataText)
    }
}
