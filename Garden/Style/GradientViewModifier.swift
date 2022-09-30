//
//  GradientViewModifier.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct GradientStyle: ViewModifier {
  var roundedCornes: CGFloat
  var startColor: Color
  var endColor: Color
  var textColor: Color
  
  func body(content: Content) -> some View {
    content
      .padding()
      .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
      .cornerRadius(roundedCornes)
      .padding(3)
      .foregroundColor(textColor)
      .overlay(RoundedRectangle(cornerRadius: roundedCornes)
        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
      .shadow(radius: 10)
  }
}

extension View {
  func gradientView(textColor: Color, startColor: Color, endColor: Color, roundedCornes: CGFloat) -> some View {
    self.modifier(GradientStyle(roundedCornes: roundedCornes, startColor: startColor, endColor: endColor, textColor: textColor))
  }
}

struct GradientViewModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .gradientView(textColor: .primary, startColor: .orange, endColor: .pink, roundedCornes: 5)
  }
}
