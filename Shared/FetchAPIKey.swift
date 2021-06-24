//
//  BundleFile.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import Foundation

extension Bundle {
    func fetchAPIKey(file: String? = nil) -> String {
        guard let url = Bundle.main.url(forResource: file ?? "apikey.txt", withExtension: nil) else {
            fatalError("API Key Not Found. Place apikey in the bundle inside apikey.txt")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to Read API Key")
        }
        
        return String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
