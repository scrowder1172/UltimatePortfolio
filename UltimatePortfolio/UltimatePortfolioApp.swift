//
// File: UltimatePortfolioApp.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 11/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 

#if canImport(CoreSpotlight)
import CoreSpotlight
#endif
import SwiftUI

@main
struct UltimatePortfolioApp: App {
    
    @StateObject var dataController = DataController()
    @Environment(\.scenePhase) var scenePhase
    
    #if os(iOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(dataController: dataController)
            } content: {
                ContentView(dataController: dataController)
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onChange(of: scenePhase) { oldValue, phase in
                    if phase != .active {
                        dataController.save()
                    }
                }
            #if canImport(CoreSpotlight)
                .onContinueUserActivity(CSSearchableItemActionType, perform: loadSpotlightItem)
            #endif
        }
    }
    
    #if canImport(CoreSpotlight)
    func loadSpotlightItem(_ userActivity: NSUserActivity) {
        if let uniqueIdentifer = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            dataController.selectedIssue = dataController.issue(with: uniqueIdentifer)
            dataController.selectedFilter = .all
        }
    }
    #endif
}
