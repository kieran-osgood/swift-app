//
// Created by Kieran Osgood on 13/11/2022.
//

import Foundation
import SwiftUI

struct BorderedCaption: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.caption2)
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(lineWidth: 1)
      )
      .foregroundColor(Color.blue)
  }
}

struct EmptyModifier: ViewModifier {

  let isEmpty: Bool

  func body(content: Content) -> some View {
    Group {
      if isEmpty {
        EmptyView()
      }
      else {
        content
      }
    }
  }
}
