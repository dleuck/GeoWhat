//
//  Flag.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import Foundation

struct Flag: Hashable, Codable, Identifiable {
    
    var code: String // Country Code
    var emoji: String
    var name: String = "" // Country
    var title: String = ""
    
    var id: Int {
        self.hashValue
    }
    
    func hash(into hasher: inout Hasher) { hasher.combine(code) }
    
    func allText() -> String {
       """
            Code: \(code)
            Name: \(name)
            Title: \(title)
        """
    }
    
    static func == (lhs: Flag, rhs: Flag) -> Bool {
        return lhs.code == rhs.code
    }
}

