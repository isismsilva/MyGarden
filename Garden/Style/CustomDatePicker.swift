//
//  CustomDatePicker.swift
//  Garden
//
//  Created by Isis Silva on 01/10/22.
//

import SwiftUI

struct CustomDatePicker: View {
  var selection: Binding<Date>
  
  var body: some View {
    DatePicker(selection: selection, displayedComponents: [.date]) {
      Text("Purchase date")
        .font(.system(size: 20, weight: .bold, design: .rounded))
    }
    .padding(12)
    .foregroundColor(.white)
    .background(Color("primaryBlue"), in: RoundedRectangle(cornerRadius: 20))
    .accentColor(Color("primaryPink"))
    .datePickerStyle(.compact)
  }
}

struct CustomDatePicker_Previews: PreviewProvider {
  static var previews: some View {
    CustomDatePicker(selection: .constant(Date()))
  }
}
