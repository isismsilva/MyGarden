//
//  GridItemListView.swift
//  Garden
//
//  Created by Isis Silva on 30/09/22.
//

import SwiftUI

struct GridItemListView: View {
  let sequence: FetchedResults<Species>
  let rows = [GridItem(.adaptive(minimum: 60), spacing: 60), GridItem(.adaptive(minimum: 60))]
  let action: ((Species) -> Void)
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: rows, spacing: 8) {
        ForEach(sequence, id: \.self) { specie in
          CapsuleButton(text: specie.name ?? "", color: Color.init(hex: specie.color ?? "") ?? .pink) {
            action(specie)
          }
        }
      }
      .padding(.all, 30)
    }
  }
}
