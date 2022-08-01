//
//  GoogleImage.swift
//  NetworkStudy
//
//  Created by JH on 2022/07/30.
//

import Foundation

struct GoogleImage: Decodable {
	let title: String?
	let searchTerms: String?
	let count: Int?
	let startIndex: Int?
	let inputEncoding: String?
	let outputEncoding: String?
	let safe: String?
	let cx: String?
}
