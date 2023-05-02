//
//  CustomButton.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import SwiftUI

struct UluButton: ButtonStyle {
    let backgroundColor: Color
    let foregrondColor: Color
    init(backgroundColor: Color, foregrondColor: Color) {
        self.backgroundColor = backgroundColor
        self.foregrondColor = foregrondColor
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 15)
            .foregroundColor(self.foregrondColor)
            .background(self.backgroundColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .frame(maxWidth: .infinity)
    }
}
