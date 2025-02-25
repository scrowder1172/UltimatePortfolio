//
// File: MacFrame.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/25/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

extension View {
    func macFrame(
        minWidth: CGFloat? = nil,
        maxWidth: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        maxHeight: CGFloat? = nil
    ) -> some View {
        #if os(macOS)
        self.frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight)
        #else
        self
        #endif
    }
}
