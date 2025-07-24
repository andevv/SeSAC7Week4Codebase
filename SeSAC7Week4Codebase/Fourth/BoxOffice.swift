//
//  BoxOffice.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/24/25.
//

import Foundation

struct boxOfficeResult: Decodable {
    let boxOfficeResult: DailyBoxOfficeList
}

struct DailyBoxOfficeList: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOffice]
}

struct BoxOffice: Decodable {
    let movieNm: String
    let openDt: String
}
