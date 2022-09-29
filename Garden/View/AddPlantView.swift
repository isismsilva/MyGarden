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
  
  var body: some View {
    VStack {
      
      ScrollView {
        
        textField("Name", input: $name)
        textField("Species", input: $species)
      }
      
      Spacer()
      
      Button {
        // Save data
      } label: {
        Text("Save")
          .frame(height: 48)
          .font(.title)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 48)
          .foregroundColor(.white)
          .background(Capsule().fill(Color("6")))
          .padding(.horizontal, 48)
          .padding(.vertical, 24)
      }
      
    }.padding(.top, 32)
  }
  
  func textField(_ placeHolder: String, input: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(placeHolder)
        .font(.headline)
        .foregroundColor(.primary)
      
      TextField(placeHolder, text: input)
        .gradientView(textColor: .primary, startColor: .orange, endColor: .purple, roundedCornes: 6)
    }
    .padding()
  }
}

struct AddPlantView_Previews: PreviewProvider {
  static var previews: some View {
    AddPlantView().preferredColorScheme(.light)
    AddPlantView().preferredColorScheme(.dark)
  }
}

