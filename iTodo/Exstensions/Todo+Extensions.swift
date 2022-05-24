//
//  Todo+Extensions.swift
//  iTodo
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import Foundation
import CoreData

extension Todo {
    static func allTodoFetchRequest() -> NSFetchRequest<Todo> {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        return request
    }
}
