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
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


    
