//
//  MenuItemSection.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/01.
//

import SwiftUI

struct MenuItemSection: View {
    let option: MenuBarOptions
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(option.title)
                .font(.title.bold())
                .padding(.vertical)
                
            ForEach(option.foodItems) { foodItem in
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(foodItem.title)
                            .font(.title2.bold())
                        
                        Text(foodItem.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("Price: \(foodItem.price)")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Image(foodItem.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 88)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Divider()
            }
            
            
        }
    }
}

struct MenuItemSection_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemSection(option: .japanese)
    }
}
