//
//  RandomDecesionButton.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 1/10/21.
//

import SwiftUI

struct RandomDecesionButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var isTapped = false
    var tasks = TaskViewModel()
    
    var body: some View {
        Button {
            isTapped.toggle()
        } label: {
            Text("Random Choice")
        }.alert(isPresented: $isTapped) { () -> Alert in
            Alert(title: Text("Your Decison Has Been Made"), message: Text("Your choice is...\n \((tasks.loadTask(context: viewContext)!.randomElement()!.name ?? "No Choice Found") as String )"), dismissButton: .default(Text("Close")))
        }
    }
}

struct RandomDecesionButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomDecesionButton()
    }
}
