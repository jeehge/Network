//
//  NavigationView.swift
//  NetworkStudy
//
//  Created by JH on 2022/08/05.
//

import SnapKit
import Then
import UIKit

typealias VoidAction = () -> Void

final class NavigationView: UIView {
	// MARK: - Properties

	private let titleLabel = UILabel().then {
		$0.font = .boldSystemFont(ofSize: 18)
		$0.textAlignment = .center
	}

	private lazy var backButton = UIButton().then {
		$0.setImage(UIImage(named: "icon-arrow-left"), for: .normal)
		$0.addTarget(self, action: #selector(backButtonTouched), for: .touchUpInside)
	}

	private lazy var rightButton = UIButton().then {
		$0.setImage(UIImage(named: "icon-share"), for: .normal)
		$0.addTarget(self, action: #selector(rightButtonTouched), for: .touchUpInside)
	}

	var backAction: VoidAction?
	var rightAction: VoidAction?

	// MARK: - Initialize

	convenience init(title: String) {
		self.init(frame: .zero)

		titleLabel.text = title
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		configView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		configView()
	}

	// MARK: - Methods

	private func configView() {
		addSubviews(backButton, rightButton, titleLabel)

		backButton.snp.makeConstraints {
			$0.left.equalToSuperview()
			$0.top.equalToSuperview()
			$0.bottom.equalToSuperview()
			$0.width.height.equalTo(self.snp.height)
		}

		rightButton.snp.makeConstraints {
			$0.right.equalToSuperview()
			$0.top.equalToSuperview()
			$0.bottom.equalToSuperview()
			$0.width.height.equalTo(self.snp.height)
		}

		titleLabel.snp.makeConstraints {
			$0.height.equalToSuperview()
			$0.right.equalTo(rightButton)
			$0.left.equalTo(backButton)
			$0.top.equalToSuperview()
		}
	}

	// MARK: - Methods

	func setTitleLabel(_ text: String?) {
		titleLabel.text = text
	}

	@objc private func backButtonTouched() {
		backAction?()
	}

	@objc private func rightButtonTouched() {
		rightAction?()
	}
}
