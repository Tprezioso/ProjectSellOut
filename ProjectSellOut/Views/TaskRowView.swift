//
//  TaskRowView.swift
//  ProjectSellOut
//
//  Created by Thomas Prezioso Jr on 12/21/20.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task

    var body: some View {
        Text(task.name ?? "No name given")
    }
}

//struct TaskRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        var task: Task
//        TaskRowView(task: task)
//    }
//}
