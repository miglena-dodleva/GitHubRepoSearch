//
//  MyGithubRepository.swift
//  search2
//
//  Created by Diviana on 5.01.23.
//


import Foundation


class MyGithubRepository: GithubRepository {
    
    let githubApi: GithubApi
//    private(set) var state = State()
    
    init(githubApi: GithubApi) {
        self.githubApi = githubApi
    }
    
    
    func searchRepositories(query: String, page: Int) async throws -> GithubResponse {
        
        return try await githubApi.searchRepository(query: query, page: page, pageSize: 10)
    
    }
}

