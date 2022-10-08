//
//  ContentView.swift
//  DemoApp
//
//  Created by Otávio Zabaleta on 07/10/2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                SCPieChartView(SCDataPoint.sampleEmployment, title: "Employment status distributions")
                    .environment(\.numberFormattterEnvironmentValue, .intgerValues)
                Divider().frame(height: 2).background(Color.gray)
                SCDonutChartView(SCDataPoint.sampleHome, title: "Home Budget")
                    .environment(\.numberFormattterEnvironmentValue, .gbp)
                Divider().frame(height: 2).background(Color.gray)
                SCDonutChartView(SCDataPoint.sampleGov, title: "Government Spenditure")
                    .environment(\.numberFormattterEnvironmentValue, .usd)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
