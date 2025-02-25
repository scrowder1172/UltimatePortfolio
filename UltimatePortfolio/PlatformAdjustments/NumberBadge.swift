//
// File: NumberBadge.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/25/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

extension View {
    func numberBadge(_ number: Int) -> some View {
        #if os(watchOS)
        self
        #else
        self.badge(number)
        #endif
    }
}
