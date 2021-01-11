//
//  TaskView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 1/3/21.
//

import SwiftUI
import CoreData

struct TaskView: View {
    
    @FetchRequest(
            entity: Task.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Task.dateAdded, ascending: false)],
            predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
        ) var notCompletedTasks: FetchedResults<Task>

    @Environment(\.managedObjectContext) private var viewContext
    var taskViewModel = TaskViewModel()


    var body: some View {
        NavigationView {
            List {
                AddTaskTextView(taskName: taskViewModel.taskName)
                
                ForEach(notCompletedTasks, id: \.self) { task in
                    TaskRowView(task: task)
                        .buttonStyle(BorderlessButtonStyle())
                    
                    //                Button(action: {
                    //                    self.updateTask(task)
                    //                }){
                    //
                    //                }
                }.onDelete(perform: removeTask)
                .buttonStyle(BorderlessButtonStyle())
            }
            .navigationTitle("Make a Decison")

        }
        RandomDecesionButton(isTapped: taskViewModel.isTapped)
            .padding()
        Spacer()
    }
    
//    func updateTask(_ task: Task) {
//           let isComplete = true
//           let taskID = task.id! as NSUUID
//           let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Task")
//           fetchRequest.predicate = NSPredicate(format: "id == %@", taskID as CVarArg)
//           fetchRequest.fetchLimit = 1
//           do {
//               let test = try viewContext.fetch(fetchRequest)
//               let taskUpdate = test[0] as! NSManagedObject
//               taskUpdate.setValue(isComplete, forKey: "isComplete")
//           } catch {
//               print(error)
//           }
//       }
    
    func removeTask(at offsets: IndexSet) {
        for index in offsets {
            let task = notCompletedTasks[index]
            viewContext.delete(task)
        }
        do {
            try viewContext.save()
        } catch {
            // handle the Core Data error
        }
    }
}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
