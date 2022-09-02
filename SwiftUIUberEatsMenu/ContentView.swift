//
//  ContentView.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: MenuBarOptions = .japanese
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                }
                
                Text("이태원 맛집")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
            // menu options list
            MenuOptionsList(selectedOption: $selectedOption)
                .padding([.top, .horizontal])
                .overlay(
                    Divider()
                        .padding(.horizontal, -16)
                    , alignment: .bottom
                )
           
            // 메뉴를 선택하면 스크롤뷰가 움직이게 하기 위해 스크롤뷰 리더를 사용한다.
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators:  false) {
                    VStack {
                        ForEach(MenuBarOptions.allCases, id: \.self) { option in
                            MenuItemSection(option: option)
                        }
                    }
                    // 메뉴 클릭하면 이동
                    .onChange(of: selectedOption, perform: { _ in
                        withAnimation(.easeInOut) { //애니메이션
                            proxy.scrollTo(selectedOption, anchor: .topTrailing)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
