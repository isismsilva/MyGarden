//
//  ImageRateView.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct ImageRateView: View {
 @Binding var rate: Int?
  let title: String
  let imageName: String
  let color: Color
  let isEditMode: Bool
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
      HStack {
        ForEach(Array((1...5).enumerated()), id: \.offset) { (index, _) in
          itemButton(index: index)
            .padding(.horizontal, 10)
            .onTapGesture {
              rate = (isEditMode) ? index+1 : rate
            }
        }
      }.frame(height: 32)
    }
  }
  
  @ViewBuilder
  func itemButton(index: Int) -> some View {
    if rate ?? 0 > index {
      Image(systemName: "\(imageName).fill")
        .resizable()
        .foregroundColor(color)
        .scaledToFit()
    } else {
      Image(systemName: imageName)
        .resizable()
        .foregroundColor(color)
        .scaledToFit()
    }
  }
}

struct DropRateView_Previews: PreviewProvider {
  static var previews: some View {
    ImageRateView(rate: .constant(3), title: "LightAmount", imageName: "sun", color: .pink, isEditMode: true)
  }
}
