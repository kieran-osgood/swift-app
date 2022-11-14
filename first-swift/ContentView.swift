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

	@State private var isBig = true

	var body: some View {
		VStack {
			Button(action: { isBig.toggle() },
					label: {
						Text(isBig ? "isBig!" : "isSmall :(")
								.borderedCaption()
								.padding(20)
								.frame(height: isBig ? 300 : 50)
								.animation(.easeInOut, value: isBig)
					})

			Image(systemName: "bus.doubledecker")
					.resizable()
					.frame(maxHeight: isBig ? 150 : 10)
					.frame(maxWidth: isBig ? 150 : 10)
					.animation(.easeInOut, value: isBig)

		}
				.enableInjection()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
