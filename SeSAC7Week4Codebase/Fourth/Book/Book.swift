//
//  Book.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/25/25.
//

import Foundation

struct BookInfo: Decodable {
    let items: [BookData]
}

struct BookData: Decodable {
    let title: String
    let link: String
    let author: String
    let pubdate: String
    let description: String
}
