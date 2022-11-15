//
// Created by Kieran Osgood on 14/11/2022.
//

import InjectHotReload
import SwiftUI
import SwifterSwift

struct TodoItem: Identifiable {
  let id = UUID()
  let text: String
}

struct CreateView: View {
  @ObservedObject private var iO = Inject.observer
  @State public var title: String = ""
  @State public var todos: [TodoItem] = []

  func submit() {
    guard !(title.isEmpty || title == "") else { return }

    todos.append(TodoItem(text: title))
    title = ""
  }

  func delete(id: UUID) {
    todos = todos.filter { $0.id != id }
  }

  var body: some View {
    VStack(alignment: .center) {
      Text("To-Do's")
        .font(.largeTitle)
        .padding(EdgeInsets(bottom: 20))

      TodoListView(todos: $todos, delete: delete)
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

  var body: some View {
    VStack(alignment: .leading) {
      ForEach(todos) { todo in
        TodoView(todo: todo, delete: delete)
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
  @State private var showingAlert = false

  var body: some View {
    HStack {
      Group {
        Image(systemName: "smallcircle.filled.circle")
        Text(todo.text).font(.body)
      }
      Spacer()
      Image(systemName: "trash")
        .symbolRenderingMode(.multicolor)
        .onTapGesture {
          showingAlert = true
        }
        .alert("Are you sure?", isPresented: $showingAlert) {
          Button("Cancel", role: .cancel) {}
          Button("Confirm", role: .destructive) { delete(todo.id) }
        }
    }
    Divider()
      .padding(.bottom, 1)
  }
}
