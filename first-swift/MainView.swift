//
//  ContentView.swift
//  first-swift
//
//  Created by Kieran Osgood on 12/11/2022.
//
//

import InjectHotReload
import SwiftUI

struct MainView: View {
  @ObservedObject private var iO = Inject.observer

  var body: some View {
    TabView {
      CreateView()
        .tabItem {
          Label("To-Do's", systemImage: "square.and.pencil")
        }
      ListView()
        .tabItem {
          Label("Animation", systemImage: "list.number")
        }
      ApiView()
        .tabItem {
          Label("API", systemImage: "network")
        }
    }
    .enableInjection()
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
