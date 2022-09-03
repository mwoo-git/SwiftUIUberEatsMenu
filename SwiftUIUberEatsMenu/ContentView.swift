//
//  ContentView.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: MenuBarOptions = .japanese
    @State private var currentOption: MenuBarOptions = .japanese
    
    // 옵션 프로퍼티가 두개 인 이유. 셀렉티드옵션은 메뉴바에서 탭했을 때, 커렌트옵션은 스크롤뷰로 스크롤했을 때.
    
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
            MenuOptionsList(selectedOption: $selectedOption, currentOption: $currentOption)
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
                            MenuItemSection(option: option, currentOption: $currentOption)
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
                .coordinateSpace(name: "scroll") //오프셋모디파이어와 링크
            }
        }
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
