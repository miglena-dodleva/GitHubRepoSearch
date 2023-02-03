//
//  GithubRepo.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


struct GithubRepoDto: Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String?
    var owner: Avatar
    var fullname: String
    var language: String?
   
    var reviewscount: Int
    var dateofcreation: String
    let url: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case language
        case fullname = "full_name"
        case dateofcreation = "created_at"
        case reviewscount = "watchers_count"
        case url = "html_url"
        
    }
}
