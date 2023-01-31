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
    @State private var results: [GithubRepo] = []
    
    @State private var currentPage: Int = 0
    @State private var totalCount: Int = 0
    
    @MainActor
    private func loadData() {
        
        self.currentPage += 1
        
        Task {
            do {
                
                let responce = try await githubRepo.searchRepositories(query: self.query, page: self.currentPage)
                self.totalCount = responce.totalCount
                
//                if hasMorePage() {
                    results.append(contentsOf: responce.items)
//                }
                
            } catch {
                //  TODO: Error handling
                
                print(error)
            }
            
            isLoading = false
        }
        
    }
    
    private func hasMorePage() -> Bool{
        let totalPages = totalCount/10+1
        return currentPage <= totalPages
        
    }
    
    private func getNextPage(index:Int){
        guard index == results.count-1 else {return}
        loadData()
    }
    
    
    var body: some View {
        
    
        
        NavigationStack {
            
                //ForEach(searchResults, id: \.self) { name in
                List{
                    ForEach(0..<results.count, id: \.self) { index in
                        
                        RepositoryView(repository: self.results[index]).onAppear {
                            if index == results.count-1 && !isLoading && totalCount > results.count {
                                loadData()
                            }
                        }
                        
                        
//                            .onAppear {self.getNextPage(index: repo)}
                    }
                }
            if isLoading{ ProgressView()}
        }
        .navigationTitle("Search")
        .searchable(text: $query)
        .onSubmit(of: .search){
            currentPage = 0
            results = []
            isLoading = true
            loadData()
            
        }
        .padding()
    }
//
//    

}

struct GitHubSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubSearchView()
    }
}
