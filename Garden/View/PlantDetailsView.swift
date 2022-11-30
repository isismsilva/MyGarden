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
          nameAndDateView.padding(.top, 16)
          HStack {
            CapsuleText(
              text: plant.plantSpecies?.name ?? "",
              textSize: 14,
              horizontalPadding: 8,
              color: Color.init(hex: plant.plantSpecies?.color ?? " ") ?? .pink
            )
            .padding(.horizontal, PlantDetailsConstants.padding)
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
            .padding(.horizontal, PlantDetailsConstants.padding)
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
            .padding(.horizontal, PlantDetailsConstants.padding)
          }
          
          Spacer(minLength: 400)
          CapsuleButton(text: "Delete", textSize: 16, horizontalPadding: 100, color: .red) {
            PersistenceController.shared.deletePlantData(plant)
            presentationMode.wrappedValue.dismiss()
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
        .padding(.horizontal, PlantDetailsConstants.padding)
      Spacer()
      Text(Utils.itemFormatter.string(from: plant.purchaseDate ?? Date()))
        .padding(6)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .background(Color("primaryPink"))
        .cornerRadius(PlantDetailsConstants.radius)
        .shadow(radius: PlantDetailsConstants.radius)
        .padding(PlantDetailsConstants.padding)
    }
    .padding(.top, PlantDetailsConstants.padding)
    .padding(.horizontal, PlantDetailsConstants.padding)
  }
  
  private enum PlantDetailsConstants {
    static let radius: CGFloat = 8
    static let padding: CGFloat = 16
  }
}

struct PlantDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    let plant: Plant = Plant(context: PersistenceController.shared.container.viewContext)
    PlantDetailsView(plant: plant)
  }
}
