//
//  ProjectSellOutApp.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 12/15/20.
//

import SwiftUI
import CoreData

@main

struct ProjectSellOutApp: App {
    let persistence = PersistenceManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class PersistenceManager {
  let persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "ProjectSellOut")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()
}
