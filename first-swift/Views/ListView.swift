//
//  ContentView.swift
//  first-swift
//
//  Created by Kieran Osgood on 12/11/2022.
//

import InjectHotReload
import SwiftUI

struct ListView: View {
  @ObservedObject private var iO = Inject.observer

  @State private var isBig = true

  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [Color.blue, Color.white]),
        startPoint: .top,
        endPoint: .bottom
      )
      .edgesIgnoringSafeArea(.top)

      VStack {
        Button(
          action: { isBig.toggle() },
          label: {
            Text(isBig ? "isBig!" : "isSmall :(")
              .padding(20)
              .borderedCaption()
              .frame(height: isBig ? 300 : 50)
              .animation(.easeInOut, value: isBig)
          })

        Spacer()

        Image(systemName: "bus.doubledecker")
          .resizable()
          .frame(maxHeight: isBig ? 150 : 10)
          .frame(maxWidth: isBig ? 150 : 10)
          .animation(.easeInOut, value: isBig)

      }
    }
    .enableInjection()
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
