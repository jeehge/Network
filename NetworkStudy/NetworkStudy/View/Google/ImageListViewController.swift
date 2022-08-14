//
//  ImageListViewController.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/23.
//

import Foundation

/**
 이미지 목록
 */
final class ImageListViewController: BaseViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
		
//		getImageList(keyword: "test")
		
		let viewerVC = ImageViewerViewController.viewController(from: .google)
		navigationController?.pushViewController(viewerVC, animated: true)
    }

    // MARK: - Method

    private func getImageList(keyword: String) {
		ImageService().getImageList(api: .image(keyword)){ [weak self] (result: Result<[ImageList], APIError>) in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                print(result)
            case let .failure(error):
                print(error)
            }
        }
    }
}
