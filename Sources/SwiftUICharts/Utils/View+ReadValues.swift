//
//  View+ReadValues.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

extension View {
    func readHeight(in space: CoordinateSpace = .local, for reader: Binding<CGFloat>) -> some View {
        readHeight(in: space) { reader.wrappedValue = $0 }
    }
    
    func readHeight(in space: CoordinateSpace = .local, for reader: @escaping (CGFloat) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Color
                    .clear
                    .preference(key: HeightKey.self, value: proxy.height(in: space))
                    .onPreferenceChange(HeightKey.self, perform: reader)
               }
           )
       }
}
               
private struct HeightKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
   
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
