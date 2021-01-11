//
//  TaskViewModel.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 1/5/21.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {

    @Published var taskName: String = ""
    @Published var isTapped = false
    func loadTask(context: NSManagedObjectContext) -> [Task]? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            let array = try context.fetch(fetchRequest) as [Task]
            return array
        } catch let error {
            print("error FetchRequest \(error)")
        }
        
        return nil
    }

}

