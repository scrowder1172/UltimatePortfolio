//
// File: Filter.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 11/14/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import Foundation

struct Filter: Identifiable, Hashable {
    var id: UUID
    var name: String
    var icon: String
    var minModificationDate: Date = Date.distantPast
    var tag: Tag?
    
    static var all = Filter(id: UUID(), name: "All Issues", icon: "tray")
    static var recent = Filter(id: UUID(), name: "Recent Issues", icon: "clock", minModificationDate: .now.addingTimeInterval(86400 * -7))
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Filter, rhs: Filter) -> Bool {
        lhs.id == rhs.id
    }
}
