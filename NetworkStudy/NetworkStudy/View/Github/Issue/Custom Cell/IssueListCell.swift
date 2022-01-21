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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let logoImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
            $0.top.bottom.equalTo(safeAreaLayoutGuide).inset(8)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(safeAreaLayoutGuide).inset(32)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(safeAreaLayoutGuide).inset(4)
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
        } else if let logoUrl = info.logoUrl {
            let url = URL(string: logoUrl)
            logoImageView.kf.setImage(with: url)
            logoImageView.isHidden = false
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
