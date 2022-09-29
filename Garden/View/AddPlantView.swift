//
//  AddPlantView.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI

struct AddPlantView: View {
  @State private var name: String = ""
  @State private var species: String = ""
  @State var image: Image? = nil
  @State var showCaptureImageView: Bool = false
  @State var imageData: Data?
  
  var body: some View {
    VStack {
      ScrollView {
        imageView
        GradientTextField(placeHolder: "Name", input: $name)
        GradientTextField(placeHolder: "Species", input: $species)
      }
      .padding(.top, 24)
      
      Spacer()
      
      Button {
        PersistenceController.shared.saveData(name, image: imageData ?? Data())
        
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
      
    }.padding(.top, 32)
  }
  
  var imageView: some View {
    ZStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Button(action: {
          showCaptureImageView.toggle()
        }) {
          if let image = image {
            image
              .resizable()
              .aspectRatio(1, contentMode: .fit)
              .frame(width: 200, height: 200)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 4))
              .shadow(radius: 10)
          } else {
            Image(systemName: "photo.circle.fill")
              .resizable()
              .frame(width: 200, height: 200)
              .foregroundColor(Color("primaryPink"))
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

