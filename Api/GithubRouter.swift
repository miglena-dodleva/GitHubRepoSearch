//
//  GithubRouter.swift
//  search2
//
//  Created by Diviana on 4.01.23.


import Foundation


class GithubRouter: Router {
    
    private let base: String = "https://api.github.com"
    
    var searchEndpoint: URL{
        
        return URL(string: base + "/search/repositories")!
    }
}
