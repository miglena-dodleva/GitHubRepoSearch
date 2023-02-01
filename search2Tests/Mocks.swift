//
//  Mocks.swift
//  search2Tests
//
//  Created by Jessica on 1.02.23.
//

import Foundation
@testable import search2

class MockRouter: Router {
    
    lazy var base = Bundle(url: Bundle(for: type(of: self)).url(forResource: "Mocks", withExtension: "bundle")!)!.bundleURL
    
    var searchEndpoint: URL {
        base.appending(path: "githubrepos")
    }
}

extension MyGithubRepository {
    
    static func makeMoc() -> GithubRepository {
        
        let router = MockRouter()
        let networkClient = MyNetworkClient()
        let api = MyGithubApi(networkClient: networkClient, router: router)
        let repo = MyGithubRepository(githubApi: api)
        return repo
    }
}
