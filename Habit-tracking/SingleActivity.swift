//
//  SingleActivity.swift
//  Habit-tracking
//
//  Created by slava bily on 2/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

struct SingleActivity: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var completionTimes: Int?
}
