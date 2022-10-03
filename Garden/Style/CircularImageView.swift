//
//  CircularImageView.swift
//  Garden
//
//  Created by Isis Silva on 01/10/22.
//

import SwiftUI

struct CircularImageView: View {
  @Binding var image: Image?
  @Binding var roundedBorderColor: Color
  
  var body: some View {
    if let image = image {
      image
        .resizable()
        .padding(4)
        .aspectRatio(1, contentMode: .fit)
        .frame(height: 180)
        .background(Color.white)
        .clipShape(Circle())
        .overlay(Circle().stroke(roundedBorderColor, lineWidth: 4))
        .shadow(radius: 10)
    } else {
      Image(systemName: "photo.circle.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(Color("primaryPink"))
        .frame(height: 180)
    }
  }
}

struct CircularImageView_Previews: PreviewProvider {
  static var previews: some View {
    CircularImageView(image: .constant(nil), roundedBorderColor: .constant(.pink))
  }
}
