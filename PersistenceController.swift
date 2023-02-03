//
//  PersistenceController.swift
//  search2
//
//  Created by Jessica on 3.02.23.
//

import Foundation
import SwiftUI
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentContainer
    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension PersistenceController {
    
    static var mockedPersistenceController: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        // Create 10 example programming languages.
        for _ in 0..<10 {
            let repo = GithubRepo(context: controller.container.viewContext)
            repo.id = 123
        }
        return controller
    }()
}
    
    
    
//    func save() {
//        let context = container.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//            // Show some error here
//            }
//        }
//    }
