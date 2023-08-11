//
//  Todo.swift
//  first-swift
//
//  Created by Kieran Osgood on 11/08/2023.
//

import Foundation
import SwiftUI

struct TodoView: View {
  var todo: TodoItem
  var delete: (_ id: UUID) -> Void
  var complete: (_ id: UUID) -> Void
  
  @State private var showingAlert = false
  @State private var animating = false
  @State private var completed = false
  
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
              .contentShape(Rectangle())
              .alert("Are you sure?", isPresented: $showingAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Confirm", role: .destructive) {
                  delete(todo.id)
                }
              }
          })
      }
      
      Divider().padding(.bottom, 1)
    }
    .animation(.easeInOut, value: animating)
    .transition(.slide)
    .onAppear { withAnimation { animating.toggle() } }
  }
}
