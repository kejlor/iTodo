//
//  CoreDataManagerTestStack.swift
//  iTodoUnitTests
//
//  Created by Bartosz Wojtkowiak on 25/05/2022.
//

import Foundation
import XCTest
import CoreData
@testable import iTodo

struct CoreDataManagerTestStack {
    let persistentContainer: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        persistentContainer = NSPersistentContainer(name: "iTodoModel")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSInMemoryStoreType
        
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("was unable to load store \(error!)")
            }
        }
        
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.automaticallyMergesChangesFromParent = true
        context.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
    }
}
