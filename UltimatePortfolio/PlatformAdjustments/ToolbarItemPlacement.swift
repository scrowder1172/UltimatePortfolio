//
// File: ToolbarItemPlacement.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/25/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

extension ToolbarItemPlacement {
    #if os(watchOS)
    static let automaticOrLeading = ToolbarItemPlacement.topBarLeading
    static let automaticOrTrailing = ToolbarItemPlacement.topBarTrailing
    #else
    static let automaticOrLeading = ToolbarItemPlacement.automatic
    static let automaticOrTrailing = ToolbarItemPlacement.automatic
    #endif
}
