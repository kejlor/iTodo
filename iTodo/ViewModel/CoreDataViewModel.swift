//
//  CoreDataViewModel.swift
//  iTodo
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import Foundation
import CoreData

final class CoreDataViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    init() {
        CoreDataManager.shared.fetchTodos()
        self.todos = CoreDataManager.shared.todos
    }
    
    func addTodo(title: String) {
        CoreDataManager.shared.addTodo(title: title)
        getStorageData()
    }
    
    func deleteTodo(indexSet: IndexSet) {
        CoreDataManager.shared.deleteTodo(indexSet: indexSet)
        getStorageData()
    }
    
    func getStorageData() {
        CoreDataManager.shared.fetchTodos()
        todos = CoreDataManager.shared.todos
    }
}
