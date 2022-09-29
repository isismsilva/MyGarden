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
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
  }()
}

