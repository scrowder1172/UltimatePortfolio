//
// File: Award.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 1/17/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import Foundation

struct Award: Decodable, Identifiable {
    var id: String { name }
    var name: String
    var description: String
    var color: String
    var criterion: String
    var value: Int
    var image: String
    
    static let allAwards = Bundle.main.decode("Awards.json", as: [Award].self)
    static let example = allAwards[0]
}
