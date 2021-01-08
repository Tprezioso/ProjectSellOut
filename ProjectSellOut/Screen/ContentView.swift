//
//  ContentView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 12/15/20.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var taskViewModel = TaskViewModel()
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            VStack {
                AddTaskTextView(taskName: taskViewModel.taskName)
                TaskView()
                Button {
                    // TODO: - Need to add functionality to Alert when a choice is made
                    print((loadTask()!.randomElement()!.name ?? "No Choice Found") as String )
                } label: {
                    Text("Random Choice")
                }
            }.navigationTitle("Make a Decesion")
        }
        
    }
    func loadTask() -> [Task]? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()

        do {
            let array = try self.viewContext.fetch(fetchRequest) as [Task]
            return array
        } catch let error {
            print("error FetchRequest \(error)")
        }

        return nil
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


