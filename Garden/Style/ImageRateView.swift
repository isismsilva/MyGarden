//
//  ImageRateView.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct ImageRateView: View {
 @Binding var rate: Int?
  let imageName: String
  let color: Color
  let isEditMode: Bool
  
  var body: some View {
    HStack {
      ForEach(Array((1...5).enumerated()), id: \.offset) { (index, _) in
        dropButton(index: index)
          .onTapGesture {
            rate = (isEditMode) ? index+1 : rate
          }
      }
    }
  }
  
  @ViewBuilder
  func dropButton(index: Int) -> some View {
    if rate ?? 0 > index {
      Image(systemName: "\(imageName).fill")
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(color)
    } else {
      Image(systemName: imageName)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(color)
    }
  }
}

struct DropRateView_Previews: PreviewProvider {
  static var previews: some View {
    ImageRateView(rate: .constant(3), imageName: "sun", color: .pink, isEditMode: true)
  }
}
