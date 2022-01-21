//
//  APIError.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/21.
//

import Foundation

enum APIError {
    case errorCode(Int)
    case noData
    case parseError
    case message(String)
}

extension APIError: LocalizedError {
    var errorText: String? {
        switch self {
        case .errorCode(let code):
            return "status code : \(code)"
        case .noData:
            return "데이터가 없습니다."
        case .parseError:
            return "파싱 에러"
        case .message(let msg):
            return "error: \(msg)"
        }
    }
}
