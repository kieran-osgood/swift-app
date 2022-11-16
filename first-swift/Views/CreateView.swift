//
// Created by Kieran Osgood on 14/11/2022.
//

import InjectHotReload
import SwiftUI
import SwifterSwift

struct TodoItem: Identifiable {
  let id = UUID()
  let text: String
  var completed: Bool = false
}

// (Self.Element) throws -> Bool
func Id<T: Identifiable>(is id: T.ID) -> (T) -> Bool { { id == $0.id } }
func Id<T: Identifiable>(isNot id: T.ID) -> (T) -> Bool { { id != $0.id } }

struct CreateView: View {
  @ObservedObject private var iO = Inject.observer
  @State public var title: String = ""
  @State public var todos: [TodoItem] = []

  func submit() {
    guard !(title.isEmpty || title == "") else { return }

    todos.append(TodoItem(text: title))
    title = ""
  }

  func delete(id: TodoItem.ID) {
    if let idx = todos.firstIndex(where: Id(is: id)) {
      todos.remove(at: idx)
    }
  }

  func complete(id: TodoItem.ID) {
    if let idx = todos.firstIndex(where: Id(is: id)) {
      todos[idx].completed.toggle()
    }
  }

  var body: some View {
    VStack(alignment: .center) {
      Text("To-Do's")
        .font(.largeTitle)
        .padding(EdgeInsets(bottom: 20))

      TodoListView(todos: $todos, delete: delete, complete: complete)
      Spacer()

      HStack {
        TextField("Title", text: $title)
          .padding(EdgeInsets(all: 10))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.init(SwifterSwift.Color.CSS.gray))
          )
        Spacer()

        Button(
          action: { submit() },
          label: {
            Text("Submit")
              .background(Color.white)
              .cornerRadius(10)
          })
      }

    }  // Container
    .padding(.horizontal, 12)
    .padding(.bottom, 12)
    .enableInjection()
  }

}

struct CreateView_Previews: PreviewProvider {
  static var previews: some View {
    CreateView()
  }
}

struct TodoListView: View {
  @Binding public var todos: [TodoItem]
  var delete: (_ id: UUID) -> Void
  var complete: (_ id: UUID) -> Void

  var body: some View {
    VStack(alignment: .leading) {
      ForEach(todos) { todo in
        TodoView(todo: todo, delete: delete, complete: complete)
      }
    }
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .topLeading
    )
    //    .isEmpty(todos.count == 0)
  }
}

struct TodoView: View {
  var todo: TodoItem
  var delete: (_ id: UUID) -> Void
  var complete: (_ id: UUID) -> Void
  @State private var showingAlert = false
  @State private var animating = 0.001
  @State private var completed: Bool = false

  var body: some View {

    VStack {
      HStack {
        Button(
          action: { complete(todo.id) },
          label: {
            Image(systemName: todo.completed ? "checkmark.square" : "square")
            Text(todo.text).font(.body)
            Spacer()
          })

        Button(
          action: { showingAlert.toggle() },
          label: {
            Image(systemName: "trash")
              .symbolRenderingMode(.multicolor)
              .alert("Are you sure?", isPresented: $showingAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Confirm", role: .destructive) {
                  delete(todo.id)
                }
              }
          })

      }

      Divider()
        .padding(.bottom, 1)
    }
    .scaleEffect(animating)
    .animation(.easeInOut, value: animating)
    .onAppear {
      animating = 1.0
    }
    .transition(.slide)
  }
}
