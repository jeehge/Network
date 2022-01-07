//
//  Reactions.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import Foundation

struct Reactions: Decodable {
    let url: String?
    let totalCount: Int
    let plusOne: Int
    let minusOne: Int
    let laugh: Int
    let hooray: Int
    let confused: Int
    let heart: Int
    let rocket: Int
    let eyes: Int
    
    enum CodingKeys: String, CodingKey {
        case url, laugh, hooray, confused, heart, rocket, eyes
        case totalCount = "total_count"
        case plusOne = "+1"
        case minusOne = "-1"
    }
}
