import Foundation

//
//  Color+.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import SwiftUI

/**
 * The extension is legacy 
 */
public extension Color {
    static func rgb(_ r: Double, _ g: Double, _ b: Double, alpha: Double = 255) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255, opacity: alpha / 255)
    }
}

func rgb(_ r: Double, _ g: Double, _ b: Double, alpha: Double = 255) -> Color {
    return Color(red: r / 255, green: g / 255, blue: b / 255, opacity: alpha / 255)
}

func rgb(_ rgb: RGB) -> Color {
    return Color.rgb(rgb.red, rgb.green, rgb.blue, alpha: rgb.alpha)
}
