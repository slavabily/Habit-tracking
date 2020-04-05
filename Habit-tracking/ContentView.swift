//
//  ContentView.swift
//  Habit-tracking
//
//  Created by slava bily on 2/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivities = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { (item) in
                    NavigationLink(destination: DetailView(activities: self.activities, title: item.title, description: item.description, completionTimes: item.completionTimes ?? 0)) {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                        }
                    }
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationBarTitle("Habit-Tracking")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddActivities.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
        }
        .sheet(isPresented: $showingAddActivities) { () -> AddView in
            AddView(activities: self.activities)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
