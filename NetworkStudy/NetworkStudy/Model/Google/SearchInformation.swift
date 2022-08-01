//
//  SearchInformation.swift
//  NetworkStudy
//
//  Created by JH on 2022/07/30.
//

import Foundation

struct SearchInformation: Decodable {
	let searchTime: Float?
	let formattedSearchTime: String?
	let totalResults: String?
	let formattedTotalResults: String?
}
