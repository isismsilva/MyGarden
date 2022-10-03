//
//  PlantDetailsView.swift
//  Garden
//
//  Created by Isis Silva on 28/09/22.
//

import SwiftUI

struct PlantDetailsView: View {
  @Environment(\.presentationMode) var presentationMode
  var plant: Plant
  
  var body: some View {
    
    VStack {
      DismissHeaderView(text: "Details") {
        presentationMode.wrappedValue.dismiss()
      }
      .frame(height: 28)
      
      VStack {
        CircularImageView(
          image: .constant(Image(uiImage: (UIImage(data: plant.image ?? Data()) ?? UIImage(named: "plant"))!)),
          roundedBorderColor: .constant(Color(hex: plant.plantSpecies?.color ?? "") ?? .white))
          .frame(width: 180, height: 180)
          .zIndex(1)
          .padding(.top, -60)
          .offset(y: 60)
        
        ScrollView(.vertical, showsIndicators: false) {
          
          nameAndDateView
          
          HStack {
            CapsuleText(
              text: plant.plantSpecies?.name ?? "",
              textSize: 14,
              horizontalPadding: 8,
              color: Color.init(hex: plant.plantSpecies?.color ?? " ") ?? .pink
            )
            .padding(.horizontal, 16)
            .shadow(radius: 8)
            Spacer()
            ImageRateView(
              rate: .constant(Int(plant.lightAmount)),
              title: "Light amount",
              imageName: "sun.max",
              textColor: .white,
              color: .orange,
              isEditMode: false,
              alignment: .trailing
            )
            .padding(.horizontal, 16)
          }
          HStack {
            Spacer()
            ImageRateView(
              rate: .constant(Int(plant.waterAmount)),
              title: "Water amount",
              imageName: "drop",
              textColor: .white,
              color: Color("primaryBlue"),
              isEditMode: false,
              alignment: .trailing
            )
            .padding(.horizontal, 16)
            
          }
        }
        .background(Color("background").opacity(0.8))
        .cornerRadius(16)
        .shadow(radius: 16)
      }
    }
    .edgesIgnoringSafeArea(.bottom)
    .toolbar(.hidden, for: .navigationBar)
  }
  
  var nameAndDateView: some View {
    HStack {
      Text(plant.name ?? "Plant")
        .foregroundColor(.white)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding(.horizontal, 16)
      Spacer()
      Text(Utils.itemFormatter.string(from: plant.purchaseDate ?? Date()))
        .padding(6)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .background(Color("primaryPink"))
        .cornerRadius(8)
        .shadow(radius: 8)
        .padding(16)
    }
    .padding(.top, 16)
    .padding(.horizontal, 16)
  }
}

//struct PlantDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//      PlantDetailsView(plant: nil, color: .pink)
//    }
//}
