//
//  search2App.swift
//  search2
//
//  Created by Diviana on 3.01.23.
//

import SwiftUI

let persistenceController = PersistenceController.shared

@main
struct search2App: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    private var githubRepo = MyGithubRepository(githubApi: MyGithubApi(networkClient: MyNetworkClient(), router: GithubRouter()))
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(githubRepo)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
