//
// File: DataController-Testing.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/25/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

extension DataController {
    func checkForTestEnvironment() {
#if DEBUG
            if CommandLine.arguments.contains("enable-testing") {
                self.deleteAll()
                #if os(iOS)
                UIView.setAnimationsEnabled(false)
                #endif
            }
#endif
    }
}
