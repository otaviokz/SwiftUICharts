//
//  SCCircleChartPart.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

protocol SCCircleChartPart: Identifiable {
    associatedtype DataPoint: SCDataPointProtocol
    
    var data: DataPoint { get }
    var title: String { get }
    var value: Double { get }
    var color: Color { get }
    var arc: Arc { get }
    var arcRad: Double { get }
    var arcRadius: CGFloat { get }
    var arcFraction: Double { get }
    var idString: String { get }
    
    func labelPosition(from centre: CGPoint) -> CGPoint
}

extension SCCircleChartPart {
    var title: String { data.title }
    var value: Double { data.value }
    
    func labelPosition(from centre: CGPoint) -> CGPoint {
        centre * CGPoint(x: 1 + arcFraction * cos(arcRad), y: 1 - arcFraction * sin(arcRad))
    }
    
    var color: Color { data.color }
    
    var id: ObjectIdentifier {
        ObjectIdentifier(NSString(string: idString))
    }
}

extension Arc {
    var halfPathRadians: Double { (from + to).radians / -2 }
}
