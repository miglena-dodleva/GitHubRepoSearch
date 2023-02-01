//
//  GitHubSearchView.swift
//  search2
//
//  Created by Diviana on 4.01.23.


import SwiftUI


struct GitHubSearchView: View {
    
    @EnvironmentObject var githubRepo: MyGithubRepository
    
    @State private var query = ""
    @State private var error: Error? = nil
    @State private var showingAlert = false
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
                
                
                    results.append(contentsOf: responce.items)
                
            } catch {
                //  TODO: Error handling
                
                showingAlert = true
                self.error = error
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
        
        ZStack {
            NavigationStack {
                
                    List{
                        ForEach(0..<results.count, id: \.self) { index in
                            
                            RepositoryView(repository: self.results[index]).onAppear {
                                if index == results.count-1 && !isLoading && totalCount > results.count {
                                    loadData()
                                }
                            }
                        }
                    }
                    .alert(error?.localizedDescription ?? "Something went wrong", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                
    //            if isLoading{ ProgressView()}
                if isLoading{
                    ZStack{
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView("Fetching GitHub")
//                            .frame(width: 120, height: 120, alignment: .center)
//                            .scaleEffect(2)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                            )
                            .frame(alignment: .center)
                            .shadow(radius: 10)
                    }
//                    .frame(alignment: .center)
                }
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
    }

}

struct GitHubSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubSearchView()
    }
}
