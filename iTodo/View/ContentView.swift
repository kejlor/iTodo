//
//  ContentView.swift
//  iTodo
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Todo.allTodoFetchRequest()) private var allTodos: FetchedResults<Todo>
    @State private var title = ""
    @State private var vm = CoreDataViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter title", text: $title)
                    .accessibilityIdentifier("titleTextField")
                
                Button("Save") {
                    vm.addTodo(title: title)
                    title = ""
                }
                .padding(10)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .accessibilityIdentifier("saveTodoButton")
                
                List {
                    ForEach(allTodos) { todo in
                        Text(todo.title ?? "")
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = allTodos[index]
                            viewContext.delete(task)

                            do {
                                try viewContext.save()
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
                .accessibilityIdentifier("todoList")
            }
        }
        .navigationTitle("Todos")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
