//
//  SCPalletes.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCPalletes {
    struct Graph {
        let colors: [Color]
        
        static var donut: Graph { Graph(colors: donutColors) }
    }
}

private extension SCPalletes.Graph {
    private static var donutColors = [Color](hex: "4770b3", "e4b031", "26727b", "50aed3", "04cc82", "9e9ea2")
}

