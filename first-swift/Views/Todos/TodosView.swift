//
// Created by Kieran Osgood on 14/11/2022.
//

import InjectHotReload
import SwiftUI
import SwifterSwift

struct TodosView: View {
  @StateObject var model = TodosViewModel();
  
  var body: some View {
    NavigationView {
      
      VStack(alignment: .center) {
        TodoListView(todos: $model.todos, delete: model.delete, complete: model.complete)
        
        Spacer()
        
        HStack {
          TextField("Title", text: $model.title)
          
            .padding(EdgeInsets(all: 10))
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(SwifterSwift.Color.CSS.gray))
            )
          
          Spacer()
          
          Button(
            action: { model.submit() },
            label: {
              Text("Submit")
                .background(Color.white)
                .cornerRadius(10)
            })
        }
        
      }  // Container
      
      //      .safeAreaInset(edge: .top, alignment: .center, content: {View()})
      .padding(.horizontal, 12)
      .padding(.bottom, 12)
      
      //      .enableInjection()
      
      //      ZStack {
      //
      //        Rectangle()
      //          .fill(.ultraThinMaterial)
      //          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      //          .frame(height: 250)
      //
      //        Text("To-Do's")
      //          .font(.largeTitle)
      //          .padding(EdgeInsets(bottom: 20))
      //      }
      //      .offset(y: -50)
    }
  }
}

struct CreateView_Previews: PreviewProvider {
  static var previews: some View {
    TodosView()
  }
}
