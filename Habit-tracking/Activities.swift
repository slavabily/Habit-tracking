//
//  Activities.swift
//  Habit-tracking
//
//  Created by slava bily on 2/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

class Activities: ObservableObject {
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([SingleActivity].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
    @Published var items = [SingleActivity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
}
