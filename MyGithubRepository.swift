//
//  MyGithubRepository.swift
//  search2
//
//  Created by Diviana on 5.01.23.
//


import Foundation

//
//struct State {
//    
//    var page: Int = 0
//    var query: String?
//    var repositories: [GithubRepo] = []
//}


class MyGithubRepository: GithubRepository {
    
    let githubApi: GithubApi
//    private(set) var state = State()
    
    init(githubApi: GithubApi) {
        self.githubApi = githubApi
    }
    
    
    func searchRepositories(query: String, page: Int) async throws -> [GithubRepo] {
        
        return try await githubApi.searchRepository(query: query, page: page, pageSize: 10)
        
//        if query != query {
//            query = query
//            page = 0
//            repositories = []
//        }
//
//        page += 1
//        do {
//            let results = try await githubApi.searchRepository(query: query, page: page, pageSize: 10)
//            repositories.append(contentsOf: results)
//        } catch {
//
//            repositories = []
//            throw error
//        }
    }
}

