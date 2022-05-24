//
//  CoreDataManager.swift
//  iTodo
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    let context: NSManagedObjectContext
    
    @Published var todos = [Todo]()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "iTodoModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data. \(error)")
            }
        }
        context = persistentContainer.viewContext
    }
    
    func fetchTodos() {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        
        do {
            todos = try context.fetch(request)
            print("✅ Fetched data")
        } catch  {
            print("❌ Error fetching data: \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        do {
            try context.save()
            fetchTodos()
            print("✅ Saved data")
        } catch {
            print("❌ Error while saving: \(error.localizedDescription)")
        }
    }
    
    func addTodo(title: String) {
        let todo = Todo(context: context)
        todo.title = title
        todo.dateCreated = Date()
        saveData()
    }
    
    func deleteTodo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let todo = todos[index]
            context.delete(todo)

            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
