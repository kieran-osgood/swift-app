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
			ContentView()
					.tabItem {
						Label("Menu", systemImage: "list.dash")
					}
//			ContentView()
//					.tabItem {
//						Label("Settings", systemImage: "list.dash")
//					}
		}
				.enableInjection()
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
