//
//  ColorStyle.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

extension Color {
  func toHex() -> String? {
    let uic = UIColor(self)
    guard let components = uic.cgColor.components, components.count >= 3 else {
      return nil
    }
    let r = Float(components[0])
    let g = Float(components[1])
    let b = Float(components[2])
    var a = Float(1.0)
    
    if components.count >= 4 {
      a = Float(components[3])
    }
    
    if a != Float(1.0) {
      return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
    } else {
      return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
  }
}

extension Color {
  init?(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt64 = 0
    
    var r: CGFloat = 0.0
    var g: CGFloat = 0.0
    var b: CGFloat = 0.0
    var a: CGFloat = 1.0
    
    let length = hexSanitized.count
    
    guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
    
    if length == 6 {
      r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
      g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
      b = CGFloat(rgb & 0x0000FF) / 255.0
      
    } else if length == 8 {
      r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
      g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
      b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
      a = CGFloat(rgb & 0x000000FF) / 255.0
      
    } else {
      return nil
    }
    
    self.init(red: r, green: g, blue: b, opacity: a)
  }
}

//extension Color {
//  private var components: (red: CGFloat, green: CGFloat, blue: CGFloat) {
//    var r: CGFloat = 0
//    var g: CGFloat = 0
//    var b: CGFloat = 0
//    var a: CGFloat = 0
//
//    guard UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else { return (0, 0, 0) }
//    return (r, g, b)
//  }
//
//  private var r: CGFloat { components.red }
//  private var g: CGFloat { components.green }
//  private var b: CGFloat { components.blue }
//
//  private func interpolate(with endColor: Color, numSteps: Int) -> [Color] {
//    let startComponents = components
//    let endComponents = endColor.components
//    let increments = (red: Double(startComponents.red - endComponents.red) / Double(numSteps - 1),
//                      green: Double(startComponents.green - endComponents.green) / Double(numSteps - 1),
//                      blue: Double(startComponents.blue - endComponents.blue) / Double(numSteps - 1))
//
//    let colors: [Color] = (0...numSteps).map {
//      let r = Double(startComponents.red) - (increments.red * Double($0))
//      let g = Double(startComponents.green) - (increments.green * Double($0))
//      let b = Double(startComponents.blue) - (increments.blue * Double($0))
//      return Color(red: r, green: g, blue: b)
//    }
//
//    return colors
//  }
//
//  func indexedColor(_ index: Int, steps: Int) -> Color {
//    Color("primaryPink").interpolate(with: Color("10"), numSteps: steps)[index]
//  }
//}
