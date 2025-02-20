//
// File: DevelopmentTests.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/19/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 

import CoreData
import XCTest
@testable import UltimatePortfolio

final class DevelopmentTests: BaseTestCase {

    func testSampleDataCreationWorks() {
        dataController.createSampleData()
        
        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 5, "There should be 5 sample tags.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 50, "There should be 50 sample issues.")
    }
    
    // delete all deletes everything
    func testDeleteAllClearsEverything() {
        dataController.createSampleData()
        dataController.deleteAll()
        
        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 0, "There should be 0 sample tags.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 0, "There should be 0 sample issues.")
    }
    
    // sample tag created without issues
    func testExampleTagHasNoIssues() {
        let tag = Tag.example
        XCTAssertEqual(tag.issues?.count, 0, "The example tag should have 0 issues.")
    }
    
    // sample issue priority is high
    func testExampleIssueIsHighPriority() {
        let issue = Issue.example
        XCTAssertEqual(issue.priority, 2, "The example issue should be high priority.")
    }
}
