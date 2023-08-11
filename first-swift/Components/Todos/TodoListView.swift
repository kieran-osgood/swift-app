//
//  TodoList.swift
//  first-swift
//
//  Created by Kieran Osgood on 11/08/2023.
//

import Foundation
import SwiftUI

struct TodoListView: View {
  @Binding public var todos: [TodoItem]
  var delete: (_ id: UUID) -> Void
  var complete: (_ id: UUID) -> Void
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      ForEach(todos) {
        TodoView(todo: $0, delete: delete, complete: complete)
      }
    }
  }
}
