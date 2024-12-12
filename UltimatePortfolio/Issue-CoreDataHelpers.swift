//
// File: Issue-CoreDataHelpers.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 11/21/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import Foundation

extension Issue {
    var issueTitle: String {
        get {title ?? "" }
        set {title = newValue}
    }
    
    var issueContent: String {
        get {content ?? "" }
        set {content = newValue}
    }
    
    var issueCreationDate: Date {
        creationDate ?? .now
    }
    
    var issueModificationDate: Date {
        modificationDate ?? .now
    }
    
    var issueTags: [Tag] {
        let result: [Tag] = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }
    
    static var example: Issue {
        let controller: DataController = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let issue = Issue(context: viewContext)
        issue.title = "Example Issue"
        issue.content = "This is an example issue."
        issue.priority = 2
        issue.creationDate = .now
        
        return issue
    }
}

extension Issue: Comparable {
    public static func <(lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.issueTitle.localizedLowercase
        let right = lhs.issueTitle.localizedLowercase
        
        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        } else {
            return left < right
        }
    }
}