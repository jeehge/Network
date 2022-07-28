//
//  IssueDetailViewController.swift
//  NetworkStudy
//
//  Created by JH on 2022/07/28.
//

import Foundation
import UIKit
import Kingfisher

/**
 이슈 상세
 */
final class IssueDetailViewController: BaseViewController {
	
	// MARK: - UI
	
	private let userInfoView = UIView()
	private let userNameLabel = UILabel()
	private let userImageView = UIImageView().then {
		$0.layer.masksToBounds = true
		$0.clipsToBounds = true
	}
	
	private let issueTextView = UITextView()
	
	var issue: Issue?
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configConstraint()
		configDetailView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		configNavigationBar()
	}
	
	// MARK: - Config
	
	private func configConstraint () {
		view.addSubviews(userInfoView, issueTextView)
		userInfoView.snp.makeConstraints {
			$0.top.leading.trailing.equalToSuperview()
			$0.height.equalTo(80)
		}
		
		issueTextView.snp.makeConstraints {
			$0.top.equalTo(userInfoView.snp.bottom)
			$0.leading.trailing.bottom.equalToSuperview().inset(8)
		}
		
		userInfoView.addSubviews(userImageView, userNameLabel)
		
		userImageView.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.leading.equalTo(userInfoView).offset(16)
			$0.width.height.equalTo(40)
		}
		
		userNameLabel.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.leading.equalTo(userImageView.snp.right).offset(16)
			$0.trailing.equalTo(userInfoView).inset(32)
		}
	}
	
	private func configDetailView() {
		userNameLabel.text = issue?.user?.name
		issueTextView.text = issue?.body
		
		let url = URL(string: issue?.user?.avatarUrl ?? "")
		DispatchQueue.main.async {
			// TODO: - constraint 에 더 어울리는 것 같다
			self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
			self.userImageView.kf.setImage(with: url)
		}
	}
	
	private func configNavigationBar() {
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.title = issue?.number.map(String.init).flatMap { "#" + $0 }
	}
}
