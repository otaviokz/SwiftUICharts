//
//  ContentView.swift
//  SwiftUIChartdsDemoApp
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                SCPieChartView("Employment status distributions", data: SCDataPoint.sampleEmployment)
                    .environment(\.numberFormatter, .intgerValues)
                Divider().frame(height: 2).background(Color.gray)
                SCDonutChartView("Home Budget", data: SCDataPoint.sampleHome)
                    .environment(\.numberFormatter, .gbp)
                Divider().frame(height: 2).background(Color.gray)
                SCDonutChartView("Government Spenditure", data: SCDataPoint.sampleGov)
                    .environment(\.numberFormatter, .usd)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
