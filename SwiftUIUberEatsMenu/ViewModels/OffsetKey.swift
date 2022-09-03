//
//  OffsetKey.swift
//  SwiftUIUberEatsMenu
//
//  Created by Woo Min on 2022/09/03.
//

import SwiftUI

// PreferenceKey 메인 스크롤뷰를 움직이면 메뉴바도 같이 움직일 수 있도록 연결해줍니다. child뷰의 업데이트를 다른 뷰로 전달. 공부 필요!

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
