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
    
    @Environment(\.presentationMode) var presentationMode
    
    var title = ""
    var description = ""
    @State var completionTimes: Int
    
    var body: some View {
        NavigationView {
            Form {
                Text(self.description)
                Text("Completion times: \(self.completionTimes)")
                Stepper("Add completion:", value: $completionTimes, in: 0 ... 1000)  
            }
            .navigationBarTitle(Text(self.title))
            .navigationBarItems(trailing: Button("Save") {
                let newItem = SingleActivity(title: self.title, description: self.description, completionTimes: self.completionTimes)
                
                if let index = self.activities.items.firstIndex(where: { (item) -> Bool in
                    item.title == self.title
                }) {
                    self.activities.items.remove(at: index)
                    self.activities.items.append(newItem)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    fatalError("Couldn't find the activity item")
                }
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(completionTimes: 0)
    }
}
