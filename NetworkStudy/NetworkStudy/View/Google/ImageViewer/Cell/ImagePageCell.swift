//
//  ImagePageCell.swift
//  NetworkStudy
//
//  Created by JH on 2022/08/05.
//

import SnapKit
import Then
import UIKit

final class ImagePageCell: UICollectionViewCell {
	// MARK: - UI

	private let scrollView = UIScrollView().then {
		$0.showsVerticalScrollIndicator = false
		$0.showsHorizontalScrollIndicator = false

		$0.maximumZoomScale = 4
		$0.minimumZoomScale = 1
	}

	private let imageView = UIImageView().then {
		$0.contentMode = .scaleAspectFit
		$0.backgroundColor = .clear
		$0.clipsToBounds = true
	}
	
	// MARK: - Initialize

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear

		scrollView.delegate = self

		contentView.addSubview(scrollView)
		scrollView.snp.makeConstraints({
			$0.size.equalTo(self.contentView)
			$0.top.right.left.bottom.equalTo(self.contentView)
		})

		scrollView.addSubview(imageView)
		imageView.snp.makeConstraints({
			$0.size.equalTo(self.scrollView)
			$0.top.right.left.bottom.equalTo(self.scrollView.contentLayoutGuide)
		})
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	func setImagePageCell(url: String) {
		
	}
}

extension ImagePageCell: UIScrollViewDelegate {
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}

	func scrollViewDidZoom(_ scrollView: UIScrollView) {
		guard let colletionView = superview as? UICollectionView else { return }

		// enlarged -> 현재 ZoomScale이 늘어나 있는 상태인지 여부
		let enlarged = scrollView.zoomScale > 1
		colletionView.isScrollEnabled = !enlarged // zoomScale 늘어나 있다면 스크롤 불가능하도록 처리

		guard let image = imageView.image else { return }

		if enlarged {
			let ratioW = imageView.frame.width / image.size.width
			let ratioH = imageView.frame.height / image.size.height

			let ratio = ratioW < ratioH ? ratioW : ratioH

			let imageWidth = image.size.width * ratio
			let imageHeight = image.size.height * ratio

			let leftCondition = imageWidth * scrollView.zoomScale > imageView.frame.width
			var leftInset = leftCondition ? (imageWidth - imageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width)
			leftInset = leftInset * 0.5

			let topCondition = imageHeight * scrollView.zoomScale > imageView.frame.height
			var topInset = topCondition ? imageHeight - imageView.frame.height : scrollView.frame.height - scrollView.contentSize.height
			topInset = topInset * 0.5

			scrollView.contentInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: topInset, right: leftInset)
		} else {
			scrollView.contentInset = .zero
		}
	}
}
