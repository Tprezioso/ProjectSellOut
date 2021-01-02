//
//  ContentView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 12/15/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var taskName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                AddTaskTextView(taskName: taskName)
                TaskView()
                Button {
                    
                } label: {
                    Text("Random Choice")
                }
            }.navigationTitle("Make a Decesion")
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AddTaskTextView: View {
    @State var taskName: String
    @Environment(\.managedObjectContext) private var viewContext
  
    var body: some View {
        HStack{
            TextField("Task Name", text: $taskName)
            Button(action: {
                self.addTask()
            }){
                Image(systemName: "plus.circle.fill")
            }
        }
        .padding()
    }

    func addTask() {
        let newTask = Task(context: viewContext)
        newTask.id = UUID()
        newTask.isComplete = false
        newTask.name = taskName
        newTask.dateAdded = Date()
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}

struct TaskView: View {
    @FetchRequest(
            entity: Task.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Task.dateAdded, ascending: false)],
            predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
        ) var notCompletedTasks: FetchedResults<Task>

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        List {
            ForEach(notCompletedTasks, id: \.self) { task in
                Button(action: {
                    self.updateTask(task)
                }){
                    TaskRowView(task: task)
                }
            }
        }
    }
    
    func updateTask(_ task: Task){
           let isComplete = true
           let taskID = task.id! as NSUUID
           let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Task")
           fetchRequest.predicate = NSPredicate(format: "id == %@", taskID as CVarArg)
           fetchRequest.fetchLimit = 1
           do {
               let test = try viewContext.fetch(fetchRequest)
               let taskUpdate = test[0] as! NSManagedObject
               taskUpdate.setValue(isComplete, forKey: "isComplete")
           } catch {
               print(error)
           }
       }
}
