//
//  ImageService.swift
//  NetworkStudy
//
//  Created by JH on 2022/07/30.
//

import Foundation
import Alamofire

final class ImageService {
	func getImageList<T: Decodable>(api: GoogleAPI, completion: @escaping (Result<T, APIError>) -> Void) {
		
		AF.request(api.path,
				   method: .get,
				   parameters: nil,
				   encoding: URLEncoding.default,
				   headers: ["Content-Type":"application/json", "Accept":"application/json"])
			.validate(statusCode: 200..<300)
			.responseDecodable(of: ImageList.self) { response in
				switch response.result {
				case .success:
					print(response)
				case .failure(let err):
					print(err)
				}
			}
	}
}




