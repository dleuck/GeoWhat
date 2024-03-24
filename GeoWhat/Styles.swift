//
//  Styles.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/28.
//

import SwiftUI

struct NormalButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    var isCorrect = false
    
    init(isCorrect: Bool) {
        self.isCorrect = isCorrect
    }
    
    func makeBody(configuration: Configuration) -> some View {
        if isCorrect {
            configuration.label
                .padding()
                .background(
                    configuration.isPressed
                        ? rgb(58, 102, 48)
                        : rgb(116, 59, 247)
                )
                .foregroundColor(.white)
                .clipShape(Capsule())
                .fontWeight(.bold)
        } else {
            configuration.label
                .padding()
                .background(
                    !isEnabled
                    ? rgb(173, 202, 247)
                    : (configuration.isPressed
                       ? rgb(43, 95, 179)
                       : rgb(59, 130, 246))
                )
                .foregroundColor(.white)
                .clipShape(Capsule())
                .fontWeight(.bold)
        }
    }
}

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                configuration.isPressed
                    ? rgb(58, 102, 48)
                    : rgb(85, 150, 71)
            )
            .foregroundColor(.white)
            .clipShape(Capsule())
            .fontWeight(.bold)
    }
    
}

