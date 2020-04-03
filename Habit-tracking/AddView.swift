//
//  AddView.swift
//  Habit-tracking
//
//  Created by slava bily on 3/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities = Activities()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                
            }
            .navigationBarTitle("Add new activity", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {

                let item = SingleActivity(title: self.title, description: self.description)
                self.activities.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
         
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
