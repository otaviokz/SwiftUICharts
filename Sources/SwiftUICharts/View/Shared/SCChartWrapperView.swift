//
//  SCChartWrapperView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCChartWrapperView<Content>: View where Content: View {
    private let title: String
    private let data: [SCDataPoint]
    @ViewBuilder private let content: (GeometryProxy) -> Content
    @State private var contentHeight: CGFloat = 0
    
    public init(_ title: String, data: [SCDataPoint], @ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.title = title
        self.data = data
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: Metric.padding)
                Text(title)
                    .font(.title.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fill)
                
                content(proxy)
                
                SCCaptionsView(data)
                    .padding(.horizontal, Metric.horizontalPadding)
                    .padding(.bottom, Metric.rowsBottom)
            }
            .frame(width: proxy.minSize)
            .padding(.vertical, Metric.padding)
            .bindHeight(to: $contentHeight)
        }
        .frame(height: contentHeight)
    }
}

private extension SCChartWrapperView {
    struct Metric {
        static var padding: CGFloat { 12 }
        static var rowsBottom: CGFloat { 12 }
        static var horizontalPadding: CGFloat { 24 }
    }
}
