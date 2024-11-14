//
// File: DataController.swift
// Project: UltimatePortfolio
// 
// Created by SCOTT CROWDER on 11/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import CoreData

class DataController: ObservableObject {
    
    @Published var selectedFilter: Filter? = Filter.all
    
    let container: NSPersistentCloudKitContainer
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        dataController.createSampleData()
        return dataController
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Main")
        
        if inMemory { container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null") }
        
        container.loadPersistentStores { storeDescription, error in
            if let error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    func createSampleData() {
        let viewContext = container.viewContext
        
        for i in 1...5 {
            let tag = Tag(context: viewContext)
            tag.id = UUID()
            tag.name = "Tag \(i)"
            
            for j in 1...10 {
                let issue = Issue(context: viewContext)
                issue.title = "Issue \(i)-\(j)"
                issue.content = "Content for issue \(i)-\(j)"
                issue.creationDate = .now
                issue.completed = Bool.random()
                issue.priority = Int16.random(in: 0...2)
                tag.addToIssues(issue)
            }
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
    
    func save() {
        do {
            if container.viewContext.hasChanges {
                try container.viewContext.save()
            }
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
    
    func delete(_ object: NSManagedObject) {
        objectWillChange.send()
        container.viewContext.delete(object)
        save()
    }
    
    private func delete(_ fetchRequest: NSFetchRequest<NSFetchRequestResult>) {
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        
        do {
            if let delete = try container.viewContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                let changes = [NSDeletedObjectsKey: delete.result as? [NSManagedObjectID] ?? []]
                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [container.viewContext])
            }
        } catch {
            print("Error deleting all data: \(error.localizedDescription)")
        }
    }
    
    func deleteAll() {
        let request1: NSFetchRequest<NSFetchRequestResult> = Tag.fetchRequest()
        delete(request1)
        
        let request2: NSFetchRequest<NSFetchRequestResult> = Issue.fetchRequest()
        delete(request2)
        
        save()
    }
}
