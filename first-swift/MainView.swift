//
//  ContentView.swift
//  first-swift
//
//  Created by Kieran Osgood on 12/11/2022.
//
//

import SwiftUI
import InjectHotReload

struct MainView: View {
	@ObservedObject private var iO = Inject.observer

	var body: some View {
		TabView {
			CreateView()
					.tabItem {
						Label("Create", systemImage: "square.and.pencil")
					}
			ListView()
					.tabItem {
						Label("List", systemImage: "list.number")
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
