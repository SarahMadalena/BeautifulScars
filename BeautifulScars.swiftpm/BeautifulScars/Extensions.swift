//
//  File.swift
//  
//
//  Created by Sarah Madalena on 18/04/23.
//

import Foundation

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
