//
//  View+ReadValues.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension View {
    func bindWidth(in space: CoordinateSpace = .local, to: Binding<CGFloat>) -> some View {
        background(
            GeometryReader { proxy in
                Color
                    .clear
                    .preference(key: WidthKey.self, value: proxy.frame(in: space).width)
                    .onPreferenceChange(WidthKey.self) { to.wrappedValue = $0 }
            }
        )
    }
    
    func bindHeight(in space: CoordinateSpace = .local, to: Binding<CGFloat>) -> some View {
        background(
            GeometryReader { proxy in
                Color
                    .clear
                    .preference(key: HeightKey.self, value: proxy.frame(in: space).height)
                    .onPreferenceChange(HeightKey.self) { to.wrappedValue = $0 }
            }
        )
    }
}

private struct HeightKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}

private struct WidthKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}
