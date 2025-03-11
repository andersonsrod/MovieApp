//
//  ShowsServiceTests.swift
//  MovieAppTests
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import XCTest
@testable import MovieApp

final class ShowsServiceTests: XCTestCase {
    
    func testFetch() async throws {
        let service = RemoteShowService()
        
        do {
            let shows = try await service.fecthShows(page: 1)
            XCTAssertFalse(shows.isEmpty)
        } catch {
            XCTFail("Error fetching Shows")
        }
    }
    
}
