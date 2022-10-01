//
//  PlantDetailsView.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

struct PlantDetailsView: View {
  let plant: Plant?
  
    var body: some View {
      VStack {
        ScrollView{
          Image(uiImage: (UIImage(data: plant?.image ?? Data()) ?? UIImage(named: "plant"))!)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .clipShape(Circle())
          
          detailList
        }
      }
    }
  
  var detailList: some View {
    VStack(alignment: .leading) {
      
      Text(plant?.name ?? "").font(.headline)
      ImageRateView(rate: .constant(Int(plant?.lightAmount ?? 0)), title: "Light amount", imageName: "sun.max", color: .orange, isEditMode: false)
      ImageRateView(rate: .constant(Int(plant?.waterAmount ?? 0)), title: "Water amount", imageName: "drop", color: Color("primaryBlue"), isEditMode: false)
      
      if let species = plant?.plantSpecies {
        Text(species.name ?? "PIPI" )
          .font(.largeTitle)
      }
    }
  }
  
}

//struct PlantDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//      PlantDetailsView(plant: nil, color: .pink)
//    }
//}
