//
//  IssueListCell.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/21.
//

import UIKit
import Kingfisher

final class IssueListCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
		$0.numberOfLines = 2
    }
    
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    override func prepareForReuse() {
        logoImageView.image = nil
        titleLabel.text = nil
    }
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configConstraint()
        configIssueListCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Config
    
    private func configConstraint() {
        contentView.addSubviews(titleLabel, logoImageView)
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
			$0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configIssueListCell() {
        accessoryType = .disclosureIndicator
    }
    
    // MARK:- Setting
    
    func setIssueListCell(by info: Issue) {
        if let empty = info.empty {
            titleLabel.text = empty
            accessoryType = .none
        } else {
            if let title = info.title,
               let number = info.number.map(String.init) {
                titleLabel.text = "\(number) - \(title)"
            } else {
                titleLabel.text = " - "
            }
        }
    }
}
