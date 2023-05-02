//
//  PrimaryActionButton.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import SwiftUI

struct PrimaryActionButton: View {
    let title: String
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    let icon: Image?
    init(
        title: String,
        foregroundColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void,
        icon: Image? = nil
    ) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
        self.icon = icon
    }
    var body: some View {
        Button {
            self.action()
        } label: {
            HStack {
                self.icon
                Text(LocalizedStringKey(self.title))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(UluButton(backgroundColor: self.backgroundColor, foregrondColor: self.foregroundColor))
    }
}
