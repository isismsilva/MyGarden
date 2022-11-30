//
//  DismissHeaderView.swift
//  Garden
//
//  Created by Isis Silva on 01/10/22.
//

import SwiftUI

struct DismissHeaderView: View {
  let text: String
  let action: (() -> Void)
  
  var body: some View {
    HStack {
      Text(text)
        .font(.system(size: 32, weight: .bold, design: .rounded))
        .padding(.horizontal, 16)
        .foregroundColor(Color("background"))
      
      Spacer()
      Button {
        action()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(Color("background"))
          .font(.system(size: 24))
          .padding(.horizontal, 24)
      }
    }
    .padding(.top, 24)
  }
}

struct DismissHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    DismissHeaderView(text: "", action: {})
  }
}
