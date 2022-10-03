//
//  Utils.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import Foundation

enum Utils {
  
  static let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "en_US")
    return formatter
  }()
}

