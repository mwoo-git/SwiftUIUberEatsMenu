//
//  OffsetModifier.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/03.
//

import Foundation
import SwiftUI

// 메인 스크롤뷰를 움직이면 메뉴바로 업데이트해줍니다.

struct OffsetModifier: ViewModifier {
    let option: MenuBarOptions
    @Binding var currentOption: MenuBarOptions
    
    func body(content: Content) -> some View {
        content // MenuItemSection에 추가할 것이므로 여기서는 MenuItemSection를 뜻함
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("scroll"))) //"scroll"을 통해 contentView와 링크
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in // 스크롤하면 currentOption 업데이트
                let offset = proxy.minY
                withAnimation {
                    currentOption = (offset < 20 && -offset < (proxy.minX / 2) && currentOption != option) ? option : currentOption // 이부분은 걱정하지 말고 복붙해도 됨! 
                }
            }
    }
}
