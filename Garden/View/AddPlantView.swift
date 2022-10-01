//
//  AddPlantView.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct AddPlantView: View {
  @Environment(\.presentationMode) var presentationMode
  @FetchRequest(sortDescriptors: []) var species: FetchedResults<Species>
  
  @State private var name: String = ""
  @State var image: Image? = nil
  @State var showCaptureImageView: Bool = false
  @State var imageData: Data?
  @State var lightAmount: Int?
  @State var waterAmount: Int?
  @State var specieState: Species?
  
  var body: some View {
    VStack {
      headerView.frame(height: 24)
      
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          
          imageView.padding(16)
          GradientTextField(placeHolder: "Name", input: $name)
          
          ImageRateView(rate: $lightAmount, title: "Light amount", imageName: "sun.max", color: .orange, isEditMode: true).padding(16)
          
          ImageRateView(rate: $waterAmount, title: "Water amount", imageName: "drop", color: Color("primaryBlue"), isEditMode: true)
            .padding(16)
          
          GridItemListView(sequence: species) { specie in
            specieState = specie
          }
          Spacer(minLength: 54)
        }
        
        saveButton
      }
      .padding(.top, 32)
      
    
    }
  }
  
  var saveButton: some View {
    Button {
      PersistenceController.shared.savePlantData(name, imageData ?? Data(), waterAmount ?? 0, lightAmount ?? 0, specieState ?? Species(context: PersistenceController.shared.container.viewContext))
      presentationMode.wrappedValue.dismiss()
      
    } label: {
      Text("Save")
        .frame(height: 48)
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 48)
        .foregroundColor(.white)
        .background(Capsule().fill(Color("primaryPink")))
        .padding(.vertical, 24)
    }
  }
  
  var headerView: some View {
    HStack {
      Spacer()
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Spacer()
        Image(systemName: "xmark")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(.primary)
          .padding(.horizontal, 24)
      }
    }
  }
  
  var imageView: some View {
    ZStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Button(action: { showCaptureImageView.toggle() }) {
          if let image = image {
            image
              .resizable()
              .aspectRatio(1, contentMode: .fit)
              .frame(width: 150, height: 150)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 4))
              .shadow(radius: 10)
          } else {
            Image(systemName: "photo.fill")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .foregroundColor(Color("primaryPink"))
              .frame(height: 150)
          }
        }
      }
      .sheet(isPresented: $showCaptureImageView) {
        CaptureImageView(isShown: $showCaptureImageView, image: $image, imageData: $imageData)
      }
    }
  }
}

struct AddPlantView_Previews: PreviewProvider {
  static var previews: some View {
    AddPlantView().preferredColorScheme(.light)
    AddPlantView().preferredColorScheme(.dark)
  }
}
