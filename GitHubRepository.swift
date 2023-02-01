//
//  GitHubRepository.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import SwiftUI



protocol GithubRepository: ObservableObject{

    func searchRepositories(query: String, page: Int) async throws -> GithubResponse
}
