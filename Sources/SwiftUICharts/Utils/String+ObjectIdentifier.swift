//
//  String+ObjectIdentifier.swift
//  
//
//  Created by Otávio Zabaleta on 06/10/2022.
//

import Foundation

extension String {
    var asObjectIdentifier: ObjectIdentifier {
        ObjectIdentifier(NSString(string: self))
    }
}
