//
//  RGB.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import SwiftUI

public struct RGB: CustomStringConvertible {

    var red: Double = 0
    var green: Double = 0
    var blue: Double = 0
    var alpha: Double = 255

    public init(_ red: Double = 0, _ green: Double = 0, _ blue: Double = 0, alpha: Double = 255) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    var color: Color {
        Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: alpha / 255)
    }
    
    public var description: String {
        "r:\(red), g:\(green), b:\(blue)"
    }
    
    // TODO
    // - lighten
    // - darken
    // - mix
}


