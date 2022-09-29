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
    ZStack {
      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(color)
        .aspectRatio(1, contentMode: .fit)
      
      VStack {
        
        Image(uiImage: (UIImage(data: image) ?? UIImage(named: "plant"))!)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(.horizontal, 24)
          
        Text(name)
          .font(.headline)
          .foregroundColor(.primary)
      }
    }
    .shadow(color: .gray.opacity(0.3), radius: 5)
  }
}

struct PlantItemView_Previews: PreviewProvider {
    static var previews: some View {
      PlantItemView(color: .primary, name: "Ísis", image: Data())
    }
}
