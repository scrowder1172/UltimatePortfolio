//
// File: IssueViewToolbar.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/19/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct IssueViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue
    
    var openCloseButtonText: LocalizedStringKey {
        issue.completed ? "Re-open Issue" : "Close Issue"
    }
    
    var body: some View {
        Menu {
            Button {
                copyToClipboard()
            } label: {
                Label("Copy Issue Title", systemImage: "doc.on.doc")
            }
            
            Button {
                issue.completed.toggle()
                dataController.save()
            } label: {
                Label(
                    openCloseButtonText,
                    systemImage: "bubble.left.and.exclamationmark.bubble.right.fill"
                )
            }
            .sensoryFeedback(trigger: issue.completed) { oldValue, newValue in
                if newValue {
                    .success
                } else {
                    nil
                }
            }
            
            Divider()
            
            Section("Tags") {
                TagsMenuView(issue: issue)
            }
        } label: {
            Label("Actions", systemImage: "ellipsis.circle")
        }
    }
    
    func copyToClipboard() {
        #if os(iOS)
        UIPasteboard.general.string = issue.issueTitle
        #else
        NSPasteboard.general.prepareForNewContents()
        NSPasteboard.general.setString(issue.issueTitle, forType: .string)
        #endif
    }
}

#Preview {
    IssueViewToolbar(issue: Issue.example)
        .environmentObject(DataController(inMemory: true))
}
