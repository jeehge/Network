//
//  Issue.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import Foundation

struct Issue: Decodable {
    let empty: String?
    let logoUrl: String?
    let homepageUrl: String?
    let url: String?
    let repositoryUrl: String?
    let labelsUrl: String?
    let commentsUrl: String?
    let eventsUrl: String?
    let htmlUrl: String?
    let id: Int
    let nodeId: String?
    let number: Int?
    let title: String?
    let user: User?
//    let labels: [String]?
    let state: String?
    let locked: Bool?
    let assignee: String?
//    let assignees: [String]?
    let milestone: String?
    let comments: Int?
    let createdAt: String?
    let updatedAt: String?
    let closedAt: String?
    let authorAssociation: String?
    let activeLockReason: String?
    let draft: Bool?
    let pullRequest: PullRequest?
    let body: String?
    let reactions: Reactions?
    let timelineUrl: String?
    let performedViaGithubApp: String?
    
    enum CodingKeys: String, CodingKey {
        case url, id, number, title, user, state, locked, assignee, milestone, comments, draft, body, reactions, logoUrl, homepageUrl, empty
        case repositoryUrl = "repository_url"
        case labelsUrl = "labels_url"
        case commentsUrl = "comments_url"
        case eventsUrl = "events_url"
        case htmlUrl = "html_url"
        case nodeId = "node_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case authorAssociation = "author_association"
        case activeLockReason = "active_lock_reason"
        case pullRequest = "pull_request"
        case timelineUrl = "timeline_url"
        case performedViaGithubApp = "performed_via_github_app"
    }
}
