//
//  Coin.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/24/25.
//

import Foundation

struct Coin: Decodable {
    let market: String
    let korean_name: String
    let english_name: String
    
    var coinOverview: String {
        get {
            return "\(market) | \(korean_name) | (\(english_name))"
        }
    }
}
