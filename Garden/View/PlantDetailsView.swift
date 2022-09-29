//
//  PlantDetailsView.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

struct PlantDetailsView: View {
  let plant: Plant?
  let color: Color
  
    var body: some View {
      
      VStack {
        Image("plant")
          .resizable()
          .aspectRatio(1, contentMode: .fit)
        
        detailList
      }
      
    }
  
  var detailList: some View {
    VStack {
      Text(plant?.name ?? "").font(.headline)
      Text(plant?.species ?? "").font(.subheadline)
      Text("")
      Text("")
    }
  }
  
}

struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      PlantDetailsView(plant: nil, color: .pink)
    }
}
