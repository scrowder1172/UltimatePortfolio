//
// File: SidebarViewToolbar.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 2/19/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct SidebarViewToolbar: View {

    @EnvironmentObject var dataController: DataController
    @State private var showingAwards: Bool = false
    @State private var showingStore: Bool = false

    var body: some View {
        Button(action: tryNewTag) {
            Label("Add tag", systemImage: "plus")
        }
        .sheet(isPresented: $showingStore) {
            StoreView()
        }

        Button {
            showingAwards.toggle()
        } label: {
            Label("Show awards", systemImage: "rosette")
        }
        .sheet(isPresented: $showingAwards, content: AwardsView.init)
        
        #if DEBUG
        Button {
            dataController.deleteAll()
            dataController.createSampleData()
        } label: {
            Label("ADD SAMPLES", systemImage: "flame")
        }
        #endif
    }
    
    func tryNewTag() {
        if dataController.newTag() == false {
            showingStore = true
        }
    }
}

#Preview {
    SidebarViewToolbar()
}
