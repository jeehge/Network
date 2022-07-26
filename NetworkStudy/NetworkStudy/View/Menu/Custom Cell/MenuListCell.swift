//
//  MenuListCell.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/30.
//

import UIKit

final class MenuListCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
    }
    
    override func prepareForReuse() {
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
        contentView.addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(safeAreaLayoutGuide).inset(8)
			$0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }
    }
    
    private func configIssueListCell() {
        
    }
    
    func setMenuCell(by info: MenuType) {
        titleLabel.text = info.title
    }
}
