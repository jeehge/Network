//
//  IssuesService.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/21.
//

import Foundation

final class IssuesService {
    func getIssues<T: Decodable>(api: GithubAPI, completion: @escaping (Result<[T], APIError>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: api.path)!) {
            data, _, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
//				let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//				print(json)
                let result = try JSONDecoder().decode([T].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
    }
}
