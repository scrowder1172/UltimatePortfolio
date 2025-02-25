//
// File: InLineNavigationBar.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/24/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

extension View {
    func inlineNavigationBar() -> some View {
        #if os(macOS)
        self
        #else
        self.navigationBarTitleDisplayMode(.inline)
        #endif
    }
}
