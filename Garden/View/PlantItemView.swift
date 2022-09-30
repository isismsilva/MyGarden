//
//  PlantItemView.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

struct PlantItemView: View {
  let color: Color
  let name: String
  let image: Data
  
  var body: some View {
    
    ZStack(alignment: .bottom) {
      
      Image(uiImage: (UIImage(data: image) ?? UIImage(named: "plant"))!)
        .resizable()
        .aspectRatio(1, contentMode: .fit).padding(8)
      
      Text(name)
        .font(.system(size: 20))
        .fontWeight(.semibold)
        .foregroundColor(color)
        .padding(.bottom, 8).shadow(color: .black, radius: 8)
      
    }
    .background(Color.white).cornerRadius(8)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(color, lineWidth: 2)
        .aspectRatio(1, contentMode: .fit)
    }
  }
}

struct PlantItemView_Previews: PreviewProvider {
  static var previews: some View {
    PlantItemView(color: .pink, name: "Ísis", image: Data()).preferredColorScheme(.dark)
  }
}
