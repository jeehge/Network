//
//  GithubAPI.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import Foundation

/**
 Github Docs >>  https://docs.github.com/en/rest/repos/repos#list-organization-repositories
 이슈 목록 가져오기 API >>  https://docs.github.com/en/rest/reference/issues
*/

enum GithubAPI {
	case getRepository(String, String)
    case issues(String, String, Int)
}

extension GithubAPI {
    static let baseURL = "https://api.github.com"
    
    var path: String {
        switch self {
		case .getRepository(let owner, let repo):
			return GithubAPI.baseURL + "/repos/\(owner)/\(repo)"
        case .issues(let owner, let repo, let page):
            return GithubAPI.baseURL + "/repos/\(owner)/\(repo)/issues?page=\(page)&per_page=30"
        }
    }
    
    var method: Method {
        switch self {
		case .getRepository:
			return .GET
        case .issues:
            return .GET
        }
    }
}
