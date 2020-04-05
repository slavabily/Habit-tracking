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
    @State private var showingBadValueAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                
            }
            .navigationBarTitle("Add new activity", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if self.title != "" && self.description != "" {
                    let item = SingleActivity(title: self.title, description: self.description, completionTimes: nil)
                    self.activities.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    // alert on problem with input
                    self.showingBadValueAlert.toggle()
                }
            })
        }
        .alert(isPresented: $showingBadValueAlert) { () -> Alert in
            Alert(title: Text("Wrong input!"), message: Text("Entered value is empty. Please, enter some activity title or description."), dismissButton: .default(Text("Ok")))
        }
         
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
