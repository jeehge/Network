//
//  GithubAPI.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import Foundation

/**
 이슈 목록 가져오기 API  https://docs.github.com/en/rest/reference/issues
*/

enum GithubAPI {
    case issues(String, String)
}

extension GithubAPI {
    static let baseURL = "https://api.github.com"
    
    var path: String {
        switch self {
        case .issues(let owner, let repo):
            return GithubAPI.baseURL + "/repos/\(owner)/\(repo)/issues"
        }
    }
    
    var method: Method {
        switch self {
        case .issues:
            return .GET
        }
    }
}
