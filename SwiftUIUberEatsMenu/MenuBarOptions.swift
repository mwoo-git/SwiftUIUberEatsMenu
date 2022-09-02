//
//  MenyBarOptions.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/01.
//

import Foundation

enum MenuBarOptions: Int, CaseIterable {
    case japanese
    case american
    case italian
    case promotions
    case fancy
    
    var title: String {
        switch self {
        case .japanese: return "Japanese"
        case .american: return "American"
        case .italian: return "Italian"
        case .promotions: return "Promotions"
        case .fancy: return "fancy"
        }
    }
    
    var foodItems: [FoodItem] {
          switch self {
          case .japanese:
              return japaneseFood
          case .american:
              return americanFood
          case .italian:
              return italianFood
          case .promotions:
              return japaneseFood + italianFood
          case .fancy:
              return italianFood
          }
      }
}
