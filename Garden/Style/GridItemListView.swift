//
//  GridItemListView.swift
//  Garden
//
//  Created by Isis Silva on 30/09/22.
//

import SwiftUI

struct GridItemListView: View {
  // TODO: Let it reusble 
  let title: String
  let sequence: FetchedResults<Species>
  let rows = Array(repeating: GridItem(.adaptive(minimum: 60), spacing: 60), count: 3)
  let action: ((Species) -> Void)
  @State var selection: Species?
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 6) {
      Text(title)
        .foregroundColor(Color("background"))
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .padding(.horizontal, 16)
      
      ZStack {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHGrid(rows: rows, spacing: 8) {
            ForEach(sequence, id: \.self) { specie in
              let color = Color.init(hex: specie.color ?? "") ?? .pink
              CapsuleButton(text: specie.name ?? "", textSize: 14, horizontalPadding: 12, color: selection == specie ? color.opacity(0.2) : color) {
                selection = specie
                action(specie)
              }
            }
          }
          .padding(.all, 30)
        }.padding()
      }
      .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("background").opacity(0.5)))
    }
  }
}

//struct GridItemListView_Preview: PreviewProvider {
//  static var previews: some View {
//    GridItemListView(title: "Family", sequence: [], action: {_ in })
//  }
//}
