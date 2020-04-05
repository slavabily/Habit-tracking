//
//  DetailView.swift
//  Habit-tracking
//
//  Created by slava bily on 3/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activities = Activities()
    
    var id = UUID()
    var title = ""
    var description = ""
    @State private var completionTimes = 0
    
    var body: some View {
        NavigationView {
            Form {
                Text(self.description)
                Text("Completion times: \(self.completionTimes)")
                Stepper("Add completion:", value: $completionTimes) {_ in
                    self.addOneCompletion()
                }
            }
            .navigationBarTitle(Text(self.title))
        }
    }
    
    func addOneCompletion() {
        let setCompletion = completionTimes
        
        let newItem = SingleActivity(title: self.title, description: self.description, completionTimes: setCompletion)
        
        if let index = activities.items.firstIndex(where: { (item) -> Bool in
            item.title == self.title
        }) {
            activities.items.remove(at: index)
            activities.items.insert(newItem, at: index)
        } else {
            fatalError("Couldn't edit the activity item")
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
