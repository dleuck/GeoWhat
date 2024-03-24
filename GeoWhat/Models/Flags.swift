//
//  Flags.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import Foundation

let flags: [Flag] = load("flags.json")

/* Do not remove - example for mutable flags var.
var flags: [Flag] {
    let objArray: [Flag] = load("flags.json")
    return objArray.sorted { $0.code < $1.code }
}
*/

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) for flags in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) for flags from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.allowsJSON5 = true
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) for flags as \(T.self):\n\(error)")
    }
}



