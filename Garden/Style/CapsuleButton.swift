//
//  CapsuleButton.swift
//  Garden
//
//  Created by Isis Silva on 30/09/22.
//

import SwiftUI

struct CapsuleButton: View {
  
  let text: String
  let color: Color
  let action: (() -> Void)
  
  var body: some View {
    Button {
      action()
    } label: {
      Text(text)
        .padding()
        .font(.subheadline.bold())
        .foregroundColor(.white)
        .background(color)
        .clipShape(Capsule())
    }
  }
}

struct CapsuleButton_Previews: PreviewProvider {
  static var previews: some View {
    CapsuleButton(text: "Lula", color: .pink, action: {})
  }
}
