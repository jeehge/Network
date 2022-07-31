//
//  GoogleAPI.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/14.
//

import Foundation

/**
 이슈 목록 가져오기 API  https://docs.github.com/en/rest/reference/issues
*/

enum GoogleAPI {
    case image(String)
}

extension GoogleAPI {
    static let baseURL = "https://www.googleapis.com"
    
	private var apikey: String {
		"AIzaSyBUPKhaeVlOHBZ98OIhWoGicdXeLTgqcG8"
	}
	
	private var engineID: String {
		"d0857c8964bf99e76"
	}
	
    var path: String {
        switch self {
            // 검색엔진ID, 키워드
        case .image(let keyword):
            return GithubAPI.baseURL + "/customsearch/v1?key=\(apikey)&cx=\(engineID)&q=\(keyword)"
        }
    }
    
    var method: Method {
        switch self {
        case .image:
            return .GET
        }
    }
}
