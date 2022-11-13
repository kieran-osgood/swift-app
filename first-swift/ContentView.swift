//
//  ContentView.swift
//  first-swift
//
//  Created by Kieran Osgood on 12/11/2022.
//
//

import SwiftUI
import InjectHotReload

struct ContentView: View {
	@ObservedObject private var iO = Inject.observer

	var body: some View {
		VStack(content: {
			Text("You have arrived my son")
					.borderedCaption()
					.padding(20)

			Image(systemName: "bus.doubledecker")
					.resizable()
					.frame(maxHeight: 10)
					.frame(maxWidth: 10)
//					.padding(EdgeInsets(all: 10))

		})
				.enableInjection()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
