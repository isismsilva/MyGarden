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
  @State private var image: Image? = nil
  @State private var showCaptureImageView: Bool = false
  @State private var imageData: Data?
  @State private var lightAmount: Int?
  @State private var waterAmount: Int?
  @State private var specieState: Species?
  @State private var date: Date = Date()
  
  var body: some View {
    VStack {
      DismissHeaderView(text: "Add Plant") {
        presentationMode.wrappedValue.dismiss()
      }
      .frame(height: 22)
      
      ScrollView(.vertical, showsIndicators: false) {
        imageView.padding(16)
        
        VStack(alignment: .leading) {
          CustomTextField(placeHolder: "Name", input: $name)
            .frame(height: 32)
            .padding(16)
          
         CustomDatePicker(selection: $date)
          .frame(height: 32)
          .padding(16)
          
          ImageRateView(
            rate: $lightAmount,
            title: "Light amount",
            imageName: "sun.max",
            textColor: Color("background"),
            color: .orange,
            isEditMode: true,
            alignment: .leading
            )
          .padding(16)
          
          ImageRateView(
            rate: $waterAmount,
            title: "Water amount",
            imageName: "drop",
            textColor: Color("background"),
            color: Color("primaryBlue"),
            isEditMode: true,
            alignment: .leading
          )
          .padding(.horizontal, 16)
          
          GridItemListView(sequence: species) { specieState = $0 }
            .padding(16)

        }
        
        saveButton
          .padding(32)
      }
      .scrollDismissesKeyboard(.immediately)
      .padding(.top, 32)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
  
  var saveButton: some View {
    let isDisabled: Bool = (name.isEmpty || (lightAmount == nil) || (waterAmount == nil) || (specieState == nil))
    return CapsuleButton(text: "Save", textSize: 24, horizontalPadding: 48, color: isDisabled ? Color("primaryPink").opacity(0.2) : Color("primaryPink")) {
      PersistenceController.shared.savePlantData(
        name,
        imageData ?? Data(),
       waterAmount ?? 0,
       lightAmount ?? 0,
       specieState ?? Species(context: PersistenceController.shared.container.viewContext)
      )
      presentationMode.wrappedValue.dismiss()
    }
    .disabled(isDisabled)
  }
  
  var imageView: some View {
    Button(action: { showCaptureImageView.toggle() }) {
      CircularImageView(image: $image, roundedBorderColor: .constant(Color(hex: specieState?.color ?? "") ?? .white) )
    }
    .sheet(isPresented: $showCaptureImageView) {
      CaptureImageView(isShown: $showCaptureImageView, image: $image, imageData: $imageData)
    }
  }
}

struct AddPlantView_Previews: PreviewProvider {
  static var previews: some View {
    AddPlantView().preferredColorScheme(.light)
    AddPlantView().preferredColorScheme(.dark)
  }
}
