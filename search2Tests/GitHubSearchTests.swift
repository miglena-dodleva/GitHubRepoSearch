//
//  GitHubSearchTests.swift
//  search2Tests
//
//  Created by Jessica on 1.02.23.
//

import Foundation
import XCTest
@testable import search2

class GitHubSearchTests: XCTestCase {
    
    let repository = MyGithubRepository.makeMoc()
    
    func testSearchRepos() async {
        
        let response = try! await repository.searchRepositories(query: "seasdsfs", page: 2)
        
        XCTAssertEqual(response.totalCount, 6)
        XCTAssertEqual(response.items.count, 3)
        XCTAssertEqual(response.items[0].description, "The Swift Programming Language")
        XCTAssertEqual(response.items[0].id, 40)
        XCTAssertEqual(response.items[2].dateofcreation, "2018-04-24T19:18:14Z")
    }
}
