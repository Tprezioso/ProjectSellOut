//
//  AddTaskTextView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 1/3/21.
//

import SwiftUI

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


struct AddTaskTextView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskTextView(taskName: "Hello")
    }
}
