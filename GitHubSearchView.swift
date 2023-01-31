//
//  GitHubSearchView.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import SwiftUI


struct GitHubSearchView: View {
    
    @EnvironmentObject var githubRepo: MyGithubRepository
    
    @State private var query = ""
    @State private var error = ""
    @State private var isLoading: Bool = false
    @State private var currentPage: Int = 0
    @State private var results: [GithubRepo] = []
    
    @MainActor
    private func loadData() {
        
        self.currentPage += 1
        
        Task {
            do {
                
                let additionalRecords = try await githubRepo.searchRepositories(query: self.query, page: self.currentPage)
                
                results.append(contentsOf: additionalRecords)
                
            } catch {
                //  TODO: Error handling
                
                print(error)
            }
            
            isLoading = false
        }
        
    }
    
//    private let repo: GithubRepo
//    init(repository: GithubRepo) {
//        self.repo = repository
//    }
//
    
    var body: some View {
        
    
        
        NavigationStack {
           // List(results){ item in
            
                //ForEach(searchResults, id: \.self) { name in
                List{
                    ForEach(results) { repo in
                                
                        NavigationLink(destination: GitHubDetails(item: repo)) {
                            
                            HStack{
                                
                                AsyncImage(url: URL(string: repo.owner.avatar)!, content: {downloadedImage in downloadedImage.resizable()}, placeholder: {Color(uiColor: UIColor.lightGray)}
                               ).scaledToFit()
                                .frame(height: 70)
                                .cornerRadius(4)
                                //.resizable()
                                //.frame(width: 80, height: 80)
                                
                                //Image(service.Avatar)
                                    
                                
                                VStack(alignment: .leading, spacing: 5){
                                    Text(repo.name)
                                        .fontWeight(.semibold)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text(repo.description ?? "null")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                }
                            }.onTapGesture {
                                UIApplication.shared.open(URL(string: repo.url)!)
                            }
                            .padding(8)
                        }
                    }
                }
            if isLoading{ ProgressView()}
        }
        .navigationTitle("Search")
        .searchable(text: $query)
        .onSubmit(of: .search){
            currentPage = 0
            isLoading = true
            loadData()
        }
        .padding()
    }
//
//    var searchResults: [String] {
//           if searchText.isEmpty {
//               return searchResults
//           } else {
//               return searchResults.filter { $0.contains(searchText) }
//           }
//       }
    
    
    
//    
//    
//    enum MyCustomError: Error {
//        
//        case invalidURL
//        case missingData
//    }
//    
    
//    private func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
//
//        let task = URLSession.shared.dataTask(with: URL(string: "http://api.github.com/search/repositories?q=swift&per_page=2&page=1")!) {
//            data, response, error in
//
//            if let error = error {
//
//                // Handle error
//                completion(.failure(error))
//            } else if let data = data {
//
//                // Handle successful response data
//                completion(.success(data))
//            }
//        }
//
//        task.resume()
//    }
}

struct GitHubSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubSearchView()
    }
}
