//
// File: PerformanceTests.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/20/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import XCTest
@testable import UltimatePortfolio

final class PerformanceTests: BaseTestCase {

    func testAwardCalculationPerformance() {
        for _ in 1...100 {
            dataController.createSampleData()
        }
        
        let awards = Array(repeating: Award.allAwards, count: 25).joined()
        
        XCTAssertEqual(awards.count, 500, "This checks the awards count is constant. Change this if you add more awards.")
        
        measure {
            _ = awards.filter(dataController.hasEarned)
        }
    }
}
