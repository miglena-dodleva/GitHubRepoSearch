//
//  Owner.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


struct Avatar: Codable {
    
    var avatar: String
    var ownername: String
    var url: String
    
    enum CodingKeys: String , CodingKey {
        case avatar = "avatar_url"
        case ownername = "login"
        case url = "html_url"
    }
}

