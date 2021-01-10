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
    @State var isTapped = false
    
    var body: some View {
        NavigationView {
            VStack {
                AddTaskTextView(taskName: taskViewModel.taskName)
                TaskView()
                RandomDecesionButton(isTapped: isTapped)
            }
            .navigationTitle("Make a Decison")
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



