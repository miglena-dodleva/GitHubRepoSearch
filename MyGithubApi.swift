//
//  MyGithubApi.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


class MyGithubApi: GithubApi {
    
    
    let networkClient: NetworkClient
    let router: Router
    
    init(networkClient: NetworkClient, router: Router){
        self.networkClient = networkClient
        self.router = router
    }
    
    func searchRepository(query: String, page: Int, pageSize: Int) async throws -> [GithubRepo] {
        
        let requestUrl = URL(string: "\(router.searchEndpoint)?q=\(query)&per_page=\(pageSize)&page=\(page)")!
        
        let request = URLRequest(url: requestUrl)
        
        let (data, _) = try await networkClient.executeRequest(request: request)
        
        //let decoder = JSONDecoder()
        let result = try JSONDecoder().decode(GithubResponse.self, from: data)
        
        return result.items
        
    }
    
    
    
}
