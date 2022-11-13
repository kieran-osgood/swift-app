//
// Created by Kieran Osgood on 13/11/2022.
//

import Foundation
import SwiftUI

extension EdgeInsets {
	public init(left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
		self.init(left: left, right: right, top: top, bottom: bottom)
	}

	public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
		self.init(left: horizontal, right: horizontal, top: vertical, bottom: vertical)
	}

	public init(all: CGFloat) {
		self.init(left: all, right: all, top: all, bottom: all)
	}
}
