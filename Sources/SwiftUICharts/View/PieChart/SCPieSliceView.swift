//
//  SCPieSliceView.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

struct SCPieSliceView: View  {
    private let slice: SCPieSlice
    
    init(_ slice: SCPieSlice) {
        self.slice = slice
    }
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.move(to: proxy.centre)
                path.addArc(proxy.centre, radius: slice.radius, arc: slice.arc)
            }
            .fill(slice.data.color)
            
            Text(slice.data.chartPercentString(with: .percent))
                .font(.callout)
                .foregroundColor(.white)
                .lineLimit(1)
                .position(slice.labelPosition(from: proxy.centre))
        }
    }
}
