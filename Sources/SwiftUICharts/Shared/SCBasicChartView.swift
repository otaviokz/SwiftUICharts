//
//  SCBasicChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCBasicChartView<Content>: View where Content: View {
    private let title: String
    @State private var vHeight: CGFloat = 0
    @ViewBuilder private let content: (GeometryProxy) -> Content
    
    init(title: String, @ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                    .frame(height: 12)
                Text(title)
                    .font(.title.weight(.semibold))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fill)
                content(proxy)
            }
            .frame(width: proxy.minSize)
            .padding(.vertical, 12)
            .readHeight(for: $vHeight)
        }
        .frame(height: vHeight)
    }
}

struct SCBasicChartView_Previews: PreviewProvider {
    static var previews: some View {
        SCBasicChartView(title: "Home Budget") { _ in EmptyView() }
    }
}
