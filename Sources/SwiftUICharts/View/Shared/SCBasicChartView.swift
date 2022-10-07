//
//  SCBasicChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCBasicChartView<Content>: View where Content: View {
    private let title: String
    @State private var stackHeight: CGFloat = 0
    @ViewBuilder private let content: (GeometryProxy) -> Content
    
    init(title: String, @ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                    .frame(height: Metric.padding)
                Text(title)
                    .font(.title.weight(.semibold))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fill)
                content(proxy)
            }
            .frame(width: proxy.minSize)
            .padding(.vertical, Metric.padding)
            .readHeight(for: $stackHeight)
        }
        .frame(height: stackHeight)
    }
}

private extension SCBasicChartView {
    struct Metric {
        static var padding: CGFloat { 12 }
    }
}
