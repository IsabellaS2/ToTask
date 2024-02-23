//
//  TextStyles.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 23/02/2024.
//

import SwiftUI

struct TextStyles {
    static var title: Text {
        return Text("")
            .font(.custom("NotoSansOriya", size: Spacing.large))
            .foregroundColor(Color("DarkPurple"))
            // Add more styling as needed
    }

    static var description: Text {
        return Text("")
            .font(.custom("NotoSansOriya", size: Spacing.spacious))
            .foregroundColor(Color("DarkPurple"))
    }
}
