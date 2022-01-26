//
//  MenuViewController.swift
//  NetworkStudy
//
//  Created by JH on 2021/10/27.
//

import UIKit

final class MenuViewController: BaseViewController {

    // MARK: - UI
    
    private lazy var listTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
//        $0.register(IssueListCell.self)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: IssueListCell.identifier, for: indexPath) as! IssueListCell
//        cell.setIssueListCell(by: list[indexPath.row])
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
}
