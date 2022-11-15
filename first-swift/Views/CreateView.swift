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
enum DBC: Error {
  case preconditionsFailed(message: String)
  //	case insufficientFunds(coinsNeeded: Int)
}
struct CreateView: View {
  @ObservedObject private var iO = Inject.observer
  @State public var title: String = ""
  @State public var todos: [TodoItem] = []

  func preconditions(of precondition: Bool, message: String) throws {
  }

  func submit() {
    guard title.isEmpty && title == "" else { return }

    todos.append(TodoItem(text: title))
    title = ""
  }

  func delete(id: UUID) {
    todos = todos.filter { $0.id != id }
  }

  var body: some View {
    VStack(alignment: .center) {
      Text("Create")
        .font(.system(size: 36))
        .padding(EdgeInsets(bottom: 20))

      TodoListView(todos: $todos, delete: delete)

      Spacer()

      HStack {
        TextField("Title", text: $title)
          .padding(EdgeInsets(all: 10))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.init(SwifterSwift.Color.CSS.aquamarine))
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
    .padding(4)
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
    .borderedCaption()
  }
}

struct TodoView: View {
  var todo: TodoItem
  var delete: (_ id: UUID) -> Void

  var body: some View {
    HStack {
      Image(systemName: "smallcircle.filled.circle")
      Text(todo.text).font(.system(size: 16))
    }
    .padding(.bottom, 1)
    .onTapGesture(perform: { delete(todo.id) })
  }
}
