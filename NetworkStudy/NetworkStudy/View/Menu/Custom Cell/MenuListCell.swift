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
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(safeAreaLayoutGuide).inset(32)
        }
    }
    
    private func configIssueListCell() {
        accessoryType = .disclosureIndicator
    }
    
    // MARK:- Setting
    
    func setMenuCell(by info: MenuType) {
        
    }
}
