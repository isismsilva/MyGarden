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
  let textColor: Color
  let color: Color
  let isEditMode: Bool
  let alignment: HorizontalAlignment
  
  var body: some View {
    VStack(alignment: alignment) {
      Text(title)
        .foregroundColor(textColor)
        .font(.system(size: isEditMode ? 20 : 14, weight: .bold, design: .rounded))
        .padding(.horizontal, 16)
      HStack {
        if isEditMode {
          ForEach(Array((1...5).enumerated()), id: \.offset) { (index, _) in
            itemButton(index: index)
              .padding(.horizontal, 6)
              .onTapGesture {
                rate = (isEditMode) ? index+1 : rate
              }
          }
        } else {
          ForEach(Array((1...(rate ?? 1)).enumerated()), id: \.offset) { (index, _) in
            itemButton(index: index)
              .padding(.horizontal, 6)
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
        .shadow(radius: 8)
        .frame(width: 26)
    } else {
      Image(systemName: imageName)
        .resizable()
        .foregroundColor(color)
        .scaledToFit()
        .frame(width: 26)
    }
  }
}

struct DropRateView_Previews: PreviewProvider {
  static var previews: some View {
    ImageRateView(rate: .constant(3), title: "LightAmount", imageName: "sun", textColor: .pink, color: .pink, isEditMode: true, alignment: .leading)
  }
}
