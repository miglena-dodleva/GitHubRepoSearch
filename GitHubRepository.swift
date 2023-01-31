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


//
//
//struct GitHubRepository: IdentifiabIle {
//    var id = UUID()
//    var imageAvatar: String
//    var title: String
//    var description: String
//}
//
//struct GitHubList {
//    static var Search = [
//        GitHubRepository(imageAvatar: "shazam", title: "Shazam", description: "My first repo"),
//        GitHubRepository(imageAvatar: "insta", title: "Instagram", description: "social media"),
//        GitHubRepository(imageAvatar: "car", title: "Car", description: "Car app project")
//    ]
//
//}
