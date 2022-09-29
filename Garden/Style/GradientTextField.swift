//
//  GradientTextField.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct GradientTextField: View {
  
  let placeHolder: String
  let input: Binding<String>
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(placeHolder)
        .font(.headline)
        .foregroundColor(.primary)
      
      TextField(placeHolder, text: input)
        .gradientView(textColor: .primary, startColor: .orange, endColor: .purple, roundedCornes: 6)
    }
    .padding()
  }
}

struct GradientTextField_Previews: PreviewProvider {
  static var previews: some View {
    GradientTextField(placeHolder: "Title", input: .constant("Value"))
  }
}
