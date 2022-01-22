//
//  URLComponents+Extension.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/22.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
