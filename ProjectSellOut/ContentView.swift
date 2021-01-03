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


