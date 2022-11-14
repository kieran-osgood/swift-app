//
// Created by Kieran Osgood on 13/11/2022.
//

import Foundation
import SwiftUI

extension View {
  func borderedCaption() -> some View {
    modifier(BorderedCaption())
  }
  /// Whether the view should be empty.
  /// - Parameter bool: Set to `true` to hide the view (return EmptyView instead). Set to `false` to show the view.
  func isEmpty(_ bool: Bool) -> some View {
    modifier(EmptyModifier(isEmpty: bool))
  }
}
