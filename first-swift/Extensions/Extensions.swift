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
  /// Calls the completion handler whenever an animation on the given value completes.
  /// - Parameters:
  ///   - value: The value to observe for animations.
  ///   - completion: The completion callback to call once the animation completes.
  /// - Returns: A modified `View` instance with the observer attached.
  func onAnimationCompleted<Value: VectorArithmetic>(
    for value: Value, completion: @escaping () -> Void
  ) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
    return modifier(
      AnimationCompletionObserverModifier(observedValue: value, completion: completion))
  }
}
