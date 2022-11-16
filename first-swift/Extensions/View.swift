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
      } else {
        content
      }
    }
  }
}

/// An animatable modifier that is used for observing animations for a given animatable value.
struct AnimationCompletionObserverModifier<Value>: AnimatableModifier
where Value: VectorArithmetic {

  /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
  var animatableData: Value {
    didSet {
      notifyCompletionIfFinished()
    }
  }

  // The target value for which we're observing. This value is directly set once the animation starts.
  // During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
  private var targetValue: Value

  /// The completion callback which is called once the animation completes.
  private var completion: () -> Void

  init(
    observedValue: Value, completion: @escaping () -> Void
  ) {
    self.completion = completion
    self.animatableData = observedValue
    targetValue = observedValue
  }

  /// Verifies whether the current animation is finished and calls the completion callback if true.
  private func notifyCompletionIfFinished() {
    guard animatableData == targetValue else { return }

    /// Dispatching is needed to take the next runloop for the completion callback.
    /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
    DispatchQueue.main.async {
      self.completion()
    }
  }

  func body(content: Content) -> some View {
    /// We're not really modifying the view so we can directly return the original input value.
    return content
  }
}
