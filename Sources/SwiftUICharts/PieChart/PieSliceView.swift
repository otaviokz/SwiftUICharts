//
//  PieSliceView.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

struct PieSliceView: View  {
    private let slice: SCPieSlice
    
    init(_ slice: SCPieSlice) {
        self.slice = slice
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Path { path in
                    path.move(to: proxy.middle)
                    path.addArc(proxy.middle, radius: slice.arcRadius, arc: slice.arc)
                }
                .fill(slice.data.color)
            }
            
            Text(slice.data.chartPercentString(with: .percent))
                .font(.callout)
                .foregroundColor(.white)
                .lineLimit(1)
                .position(slice.labelPosition(from: proxy.centre))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
