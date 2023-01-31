//
//  GithubResponse.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


struct GithubResponse: Codable {
    
    var totalCount: Int
    var items: [GithubRepo]
    
    enum CodingKeys: String, CodingKey {
        
        case items
        case totalCount = "total_count"
    }
}

