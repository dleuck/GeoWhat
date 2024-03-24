//
//  View+.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import SwiftUI

public extension View {
    func hspace(_ size: Double) -> some View { Spacer().frame(width: size) }
    func vspace(_ size: Double) -> some View { Spacer().frame(height: size) }
}

