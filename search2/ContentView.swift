//
//  ContentView.swift
//  search2
//
//  Created by Diviana on 3.01.23.
//

import SwiftUI

struct ContentView: View {
    //@State private var searchText = ""
    
    @State private var hideSplashView = false
    @EnvironmentObject var githubRepo: MyGithubRepository
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //@EnvironmentObject var githubService: GithubRepo
    
    
    var body: some View {
        
        if hideSplashView {
            
            GitHubSearchView()
        } else {
            VStack {
                GitHubImage()
                    .offset(y: -10)
                
            }
            .padding()
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                    self.hideSplashView = true
                }
            }
        }
    }
}
