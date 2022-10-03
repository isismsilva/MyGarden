//
//  CapsuleText.swift
//  Garden
//
//  Created by Isis Silva on 02/10/22.
//

import SwiftUI

struct CapsuleText: View {
  let text: String
  let textSize: CGFloat
  let horizontalPadding: CGFloat
  let color: Color
  
    var body: some View {
      Text(text)
        .padding()
        .font(.system(size: textSize, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal, horizontalPadding)
        .background(color)
        .clipShape(Capsule())
    }
}

struct CapsuleText_Previews: PreviewProvider {
    static var previews: some View {
      CapsuleText(text: "", textSize: 12, horizontalPadding: 12, color: .pink)
    }
}
