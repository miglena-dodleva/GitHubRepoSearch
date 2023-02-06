//
//  MyGithubRepository.swift
//  search2
//
//  Created by Diviana on 5.01.23.


import Foundation
import SwiftUI
import CoreData


//@FetchRequest(fetchRequest: GithubRepo.getAll())
//var items: FetchedResults<GithubRepo>

class MyGithubRepository: GithubRepository, ObservableObject {
    
    let githubApi: GithubApi
//    private(set) var state = State()
    
    init(githubApi: GithubApi) {
        self.githubApi = githubApi
    }
    
    
    func searchRepositories(query: String, page: Int) async throws -> GithubResponse {
        
        return try await githubApi.searchRepository(query: query, page: page, pageSize: 10)
    
    }
    
   
  
}

func getAll() -> FetchRequest<GithubRepo> {
    
    var items: [GithubRepoDto] = []
    for item in items {
        
        let request = FetchRequest<GithubRepo>(entity: GithubRepo.entity(), sortDescriptors: [NSSortDescriptor()], predicate: NSPredicate(format: "id == %@ AND name == %@", "44", "Swift"))
        
        let existing = try context.fetch(request).first ?? item(context:context)
        
        return request
    }
}
