//
//  Array+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import Foundation

extension Array {
    func addingOffsets() -> Array<(offset: Int, element: Element)> {
        Array<(offset: Int, element: Element)>(enumerated())
    }
}
