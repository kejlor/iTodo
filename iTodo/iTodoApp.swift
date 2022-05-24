//
//  iTodoApp.swift
//  iTodo
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import SwiftUI

@main
struct iTodoApp: App {
    let persistenceContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
