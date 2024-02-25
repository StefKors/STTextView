//  Created by Marcin Krzyzanowski
//  https://github.com/krzyzanowskim/STTextView/blob/main/LICENSE.md

import Foundation
import SwiftUI

public protocol TextViewModifier: SwiftUI.View { }

extension STTextViewUI.TextView: TextViewModifier {

    public struct EnvironmentModifier<Content: View, V>: View, TextViewModifier {
        let content: Content
        let keyPath: WritableKeyPath<EnvironmentValues, V>
        let value: V

        public var body: some View {
            content
                .environment(keyPath, value)
        }
    }

}

extension TextViewModifier {

    /// Sets the default font for text in this view.
    public func textViewFont(_ font: NSFont) -> TextView.EnvironmentModifier<Self, NSFont> {
        TextView.EnvironmentModifier(content: self, keyPath: \.font, value: font)
    }
    
    /// Enables the text view ruler
    public func textViewRuler(_ visible: Bool) -> TextView.EnvironmentModifier<Self, Bool> {
        TextView.EnvironmentModifier(content: self, keyPath: \.isRulerVisible, value: visible)
    }
    
    /// Set the default font for the text view ruler in this view.
    public func textViewRuler(_ font: NSFont) -> TextView.EnvironmentModifier<Self, NSFont> {
        TextView.EnvironmentModifier(content: self, keyPath: \.rulerFont, value: font)
    }
}
