//  Created by Marcin Krzyzanowski
//  https://github.com/krzyzanowskim/STTextView/blob/main/LICENSE.md

import Foundation
import AppKit
import SwiftUI

private struct FontEnvironmentKey: EnvironmentKey {
    static var defaultValue: NSFont = .preferredFont(forTextStyle: .body)
}

private struct IsRulerVisibleEnvironmentKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

internal extension EnvironmentValues {
    var font: NSFont {
        get { self[FontEnvironmentKey.self] }
        set { self[FontEnvironmentKey.self] = newValue }
    }

    var isRulerVisible: Bool {
        get { self[IsRulerVisibleEnvironmentKey.self] }
        set { self[IsRulerVisibleEnvironmentKey.self] = newValue }
    }
}


