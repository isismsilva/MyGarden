//
//  ContentView.swift
//  GardenWatch Watch App
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
      
      Button {
        connectivityManager.send("Hello iPhone")
      } label: {
        Text("Tap me")
      }

    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
