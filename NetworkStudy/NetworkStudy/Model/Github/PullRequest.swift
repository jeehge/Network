//
//  PullRequest.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import Foundation

struct PullRequest: Decodable {
    let url: String?
    let htmlUrl: String?
    let diffUrl: String?
    let patchUrl: String?
    let mergedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case htmlUrl = "html_url"
        case diffUrl = "diff_url"
        case patchUrl = "patch_url"
        case mergedAt = "merged_at"
    }
}
