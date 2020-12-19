//
//  ContentView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 12/15/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        HStack{
                TextField("Task Name", text: $taskName)
                Button(action: {
                    self.addTask()
                }){
                    Image(systemName: "plus.circle.fill")
                }
            }            .padding()
    }

    func addTask() {
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.isCompleted = false
        newTask.name = taskName
        newTask.dateAdded = Date()
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
