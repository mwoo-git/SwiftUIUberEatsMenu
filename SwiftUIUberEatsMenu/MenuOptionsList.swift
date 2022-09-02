//
//  MenuOptionsList.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/01.
//

import SwiftUI

struct MenuOptionsList: View {
    @Binding var selectedOption: MenuBarOptions //터치하면 작동
    @Namespace var animation // 메뉴바 밑의 선이 순간이동 하던 것을 자연스럽게 바꾸기위함 (matchedGeometryEffect)
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(MenuBarOptions.allCases, id: \.self) { item in
                        VStack {
                            Text(item.title)
                                .foregroundColor(item == selectedOption ? .black : .gray)
                            
                            //움직이는 바
                            if selectedOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation) //메뉴바 밑의 선 자연스럽게 이동
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.selectedOption = item
                                // 터치하면 셀렉티드옵션 값을 아이템 값으로 바꿔줍니다.
                                
                                // 메뉴를 선택하면 예쁘게(?) 이동 할 수 있도록 해주는 코드
                                proxy.scrollTo(item, anchor: .topTrailing)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MenuOptionsList_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionsList(selectedOption: .constant(.american))
        //셀렉티드 옵션 기본값이 재패니스. 셀렉티브 옵션값에 따라 보이는게 바뀐다.
    }
}
