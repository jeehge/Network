//
//  MenuViewController.swift
//  NetworkStudy
//
//  Created by JH on 2021/10/27.
//

import UIKit

typealias MenuType = (type: MenuCellType, title: String)

final class MenuViewController: BaseViewController {
    
    // MARK: - UI
    
    private lazy var listTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(MenuListCell.self)
    }
    
    private var menuTypes: [MenuType] {
        return [MenuType(type: .common, title: "Google"),
                MenuType(type: .common, title: "Github")]
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configConstraint()
        configNavigationBar()
    }
    
    // MARK: - Config
    
    private func configNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configConstraint() {
        view.addSubview(listTableView)
        
        listTableView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuListCell.identifier, for: indexPath) as! MenuListCell
        cell.setMenuCell(by: menuTypes[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menuTypes[indexPath.row].title {
        case "Google":
            let imageListVC = ImageListViewController.viewController(from: .main)
            navigationController?.pushViewController(imageListVC, animated: true)
        case "Github":
            let issueListVC = IssueListViewController.viewController(from: .main)
//            navigationController?.pushViewController(issueListVC, animated: true)
        default:
            break
        }
    }
}
