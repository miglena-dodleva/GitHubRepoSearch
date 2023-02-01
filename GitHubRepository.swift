//
//  GitHubRepository.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//


protocol GithubRepository {

    func searchRepositories(query: String, page: Int) async throws -> GithubResponse
}
