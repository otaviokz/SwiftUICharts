//
//  SCCircleChartPart.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

internal protocol SCCircleChartPart: Identifiable {
    var data: SCDataPoint { get }
    var padding: CGFloat { get }
    var title: String { get }
    var value: Double { get }
    var color: Color { get }
    var arc: Arc { get }
    var midRadian: Double { get }
    var radius: CGFloat { get }
    var xyFix: Double { get }
    var idString: String { get }
    
    func labelPosition(from centre: CGPoint) -> CGPoint
}

internal extension SCCircleChartPart {
    var title: String { data.title }
    var value: Double { data.value }
    var color: Color { data.color }
    var id: ObjectIdentifier { idString.asObjectIdentifier }
    var baseIsString: String { "\(data.idString)\(radius)\(padding)\(midRadian)" }
    
    func labelPosition(from centre: CGPoint) -> CGPoint {
        centre * CGPoint(1 + xyFix * cos(midRadian), 1 - xyFix * sin(midRadian))
    }
}
