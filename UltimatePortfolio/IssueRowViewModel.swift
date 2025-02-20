//
// File: IssueRowViewModel.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/20/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import Foundation

extension IssueRow {
    @dynamicMemberLookup
    class ViewModel: ObservableObject {
        let issue: Issue
        
        var iconOpacity: Double {
            issue.priority == 2 ? 1 : 0
        }
        
        var iconIdentifier: String {
            issue.priority == 2 ? "\(issue.issueTitle) High Priority" : ""
        }
        
        var accessibilityHint: String {
            issue.priority == 2 ? "High Priority" : ""
        }
        
        var issueFormattedCreationDate: String {
            issue.issueCreationDate.formatted(date: .numeric, time: .omitted)
        }
        
        var accessibilityCreationDate: String {
            issue.issueCreationDate.formatted(date: .abbreviated, time: .omitted)
        }
        
        init(issue: Issue) {
            self.issue = issue
        }
        
        subscript<Value>(dynamicMember keyPath: KeyPath<Issue, Value>) -> Value {
            issue[keyPath: keyPath]
        }
    }
}
