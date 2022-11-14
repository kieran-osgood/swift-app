//
// Created by Kieran Osgood on 14/11/2022.
//

import InjectHotReload
import SwiftUI
import SwifterSwift

struct CreateView: View {
  @ObservedObject private var iO = Inject.observer
  @State private var title: String = ""

  func submit() {
    let a = true
  }

  var body: some View {
    VStack(alignment: .center) {
      Text("Create").font(.system(size: 36))

      TextField(
        "Title",
        text: $title
      )
      .border(Color.init(SwifterSwift.Color.CSS.aquamarine), width: 1)
      .padding(4)

      Button(
        action: { submit() },
        label: {
          Text("Submit")
            .borderedCaption()
            .padding(20)
        })

      //			Image(systemName: "bus.doubledecker")
      //					.resizable()
      //					.frame(maxHeight: isBig ? 150 : 10)
      //					.frame(maxWidth: isBig ? 150 : 10)
      //					.animation(.easeInOut, value: isBig)
    }
    .frame(maxWidth: 250)
    .padding(4)
    .enableInjection()
  }
}

struct CreateView_Previews: PreviewProvider {
  static var previews: some View {
    CreateView()
  }
}
