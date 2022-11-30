//
//  PlantItemView.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

struct PlantItemView: View {
  let color: Color
  let image: Data
  
  var body: some View {
    ZStack {
      Image(uiImage: (UIImage(data: image) ?? UIImage(named: "plant"))!)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .padding(4)
    }
    .background(Color.white.opacity(0.8))
    .cornerRadius(8)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(color, lineWidth: 4)
        .aspectRatio(1, contentMode: .fit)
    }
  }
}

struct PlantItemView_Previews: PreviewProvider {
  static var previews: some View {
    PlantItemView(color: .pink, image: Data()).preferredColorScheme(.dark)
  }
}
