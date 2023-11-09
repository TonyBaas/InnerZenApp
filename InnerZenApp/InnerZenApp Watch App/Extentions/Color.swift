//
//  Color.swift
//  InnerZenApp Watch App
//
//  Created by Tony Baas, Reaenn Wiebers, Rohan Basnet on 10/19/23.
//  This is our InnerZen app which is just an app to get back
//  in touch with yourself

import Foundation
import SwiftUI

// This links the colors from Assents to the code.
extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let accent2 = Color("AccentColor2")
}
