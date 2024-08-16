//
//  TextStyles.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 23/02/2024.
//

import SwiftUI

struct TextStyles {
    // Style for Titles
    static func titleStyle() -> some ViewModifier {
        return TextStyleModifier(font: .custom("Gill Sans", size: Spacing.large),
                                color: Color("DarkPurple"),
                                applyPadding: false)
    }

    // Style for Descriptions
    static func descriptionStyle() -> some ViewModifier {
        return TextStyleModifier(font: .custom("Gill Sans", size: Spacing.spacious),
                                color: Color("DarkPurple"),
                                applyPadding: false)
    }
    
    // Style for Bullet Points
    static func bulletPointStyle() -> some ViewModifier {
        return TextStyleModifier(font: .custom("Gill Sans", size: Spacing.considerable),
                                color: Color("DarkPurple"),
                                applyPadding: true)
    }

    struct TextStyleModifier: ViewModifier {
        let font: Font
        let color: Color
        let applyPadding: Bool

        func body(content: Content) -> some View {
            content
                .font(font)
                .foregroundColor(color)
                .padding(.bottom, applyPadding ? 4.0 : 0)
        }
    }
}


