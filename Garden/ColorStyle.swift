//
//  ColorStyle.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

extension Color {
  private var components: (red: CGFloat, green: CGFloat, blue: CGFloat) {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    
    guard UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else { return (0, 0, 0) }
    return (r, g, b)
  }
  
  private var r: CGFloat { components.red }
  private var g: CGFloat { components.green }
  private var b: CGFloat { components.blue }
  
  private func interpolate(with endColor: Color, numSteps: Int) -> [Color] {
    let startComponents = components
    let endComponents = endColor.components
    let increments = (red: Double(startComponents.red - endComponents.red) / Double(numSteps - 1),
                      green: Double(startComponents.green - endComponents.green) / Double(numSteps - 1),
                      blue: Double(startComponents.blue - endComponents.blue) / Double(numSteps - 1))
    
    let colors: [Color] = (0...numSteps).map {
      let r = Double(startComponents.red) - (increments.red * Double($0))
      let g = Double(startComponents.green) - (increments.green * Double($0))
      let b = Double(startComponents.blue) - (increments.blue * Double($0))
      return Color(red: r, green: g, blue: b)
    }
    
    return colors
  }
  
  func indexedColor(_ index: Int, steps: Int) -> Color {
    Color("primaryPink").interpolate(with: Color("10"), numSteps: steps)[index]
  }
}

//enum ColorStyle: CaseIterable {
//case a, b, c, d, e, f, g, h, i, j, k, l, m, n
//
//  var color: Color {
//    switch self {
//    case .a:
//      return Color("1")
//    case .b:
//      return Color("2")
//    case .c:
//      return Color("3")
//    case .d:
//      return Color("4")
//    case .e:
//      return Color("5")
//    case .f:
//      return Color("6")
//    case .g:
//      return Color("7")
//    case .h:
//      return Color("8")
//    case .i:
//      return Color("9")
//    case .j:
//      return Color("10")
//    case .k:
//      return Color("11")
//    case .l:
//      return Color("12")
//    case .m:
//      return Color("13")
//    case .n:
//      return Color("14")
//    }
//  }
//}
//
