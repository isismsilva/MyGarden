//
//  CapsuleButton.swift
//  Garden
//
//  Created by Isis Silva on 30/09/22.
//

import SwiftUI

struct CapsuleButton: View {
  
  let text: String
  let textSize: CGFloat
  let horizontalPadding: CGFloat
  let color: Color
  let action: (() -> Void)
  
  var body: some View {
    Button {
      action()
    } label: {
      Text(text)
        .padding()
        .font(.system(size: textSize, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal, horizontalPadding)
        .background(color)
        .clipShape(Capsule())
    }
  }
}

struct CapsuleButton_Previews: PreviewProvider {
  static var previews: some View {
    CapsuleButton(text: "Save", textSize: 13, horizontalPadding: 48, color: .pink, action: {})
  }
}
