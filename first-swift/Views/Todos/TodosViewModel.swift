//
//  TodosViewModel.swift
//  first-swift
//
//  Created by Kieran Osgood on 11/08/2023.
//

import Foundation

struct TodoItem: Identifiable {
  let id = UUID()
  let text: String
  var completed: Bool = false
}

let initialTodos: [TodoItem] = (1...25).map { TodoItem(text: String($0)) }

func Id<T: Identifiable>(is id: T.ID) -> (T) -> Bool { { id == $0.id } }

class TodosViewModel : ObservableObject {
  //    @ObservedObject private var iO = Inject.observer
  @Published public var title: String = ""
  @Published public var todos: [TodoItem] = initialTodos
  
  func complete(id: TodoItem.ID) {
    if let idx = todos.firstIndex(where: Id(is: id)) {
      todos[idx].completed.toggle()
    }
  }
  
  func delete(id: TodoItem.ID) {
    if let idx = todos.firstIndex(where: Id(is: id)) {
      todos.remove(at: idx)
    }
  }
  
  func submit() {
    guard !title.isEmpty else { return }
    
    todos.append(TodoItem(text: title))
    title = ""
  }
}
