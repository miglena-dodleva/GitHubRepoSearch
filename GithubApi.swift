//
//  GithubApi.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


protocol GithubApi {
    
    
    func searchRepository(query: String, page: Int, pageSize: Int) async throws -> GithubResponse
}

