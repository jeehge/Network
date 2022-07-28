//
//  IssueListViewController.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/21.
//

import UIKit

/**
 이슈 목록
 */
final class IssueListViewController: BaseViewController {
    
    // MARK: - UI
    
    private lazy var listTableView = UITableView().then {
        $0.register(IssueListCell.self)
		$0.delegate = self
		$0.dataSource = self
		$0.rowHeight = UITableView.automaticDimension
		$0.estimatedRowHeight = 44.0
    }
    
    private var list: [Issue] = []
    private var repoTitle: String = "" {
        didSet {
            navigationItem.title = repoTitle
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configConstraint()
        configNavigationBar()
		
		getIssues()
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
    
    private func getIssues(owner: String = "apple", repo: String = "swift") {
        IssuesService().getIssues(api: .issues(owner, repo)) { [weak self] (result: Result<[Issue], APIError>) in
            guard let self = self else { return }
            switch result {
            case .success(let result):
                let list: [Issue] = result
                self.list = list
                
                DispatchQueue.main.async {
                    self.repoTitle = "\(owner)/\(repo)"
                    self.listTableView.reloadData()
                }
            case .failure(let error):
                print(error)
//                let alertController = UIAlertController(title: "Error", message: "Repo Error", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//                    let repo = self.repoTitle.components(separatedBy: "/")
//                    self.getIssues(owner: owner, repo: repo[1])
//                }
//                alertController.addAction(okAction)
//                DispatchQueue.main.async {
//                    self.present(alertController, animated: true, completion: nil)
//                }
            }
        }
    }
    
    @IBAction private func actionSearch(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Repository Input", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let repo = alertController.textFields?[0].text?.components(separatedBy: "/"), repo.count >= 2 {
                self.getIssues(owner: repo[0], repo: repo[1])
            } else {
                let alertController = UIAlertController(title: "Error", message: "Form Error", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    let repo = self.repoTitle.components(separatedBy: "/")
                    self.getIssues(owner: repo[0], repo: repo[1])
                }
                alertController.addAction(okAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cance", style: .cancel, handler: nil)
        alertController.addTextField {
            $0.placeholder = "apple/swift Form Inputs :)"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension IssueListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssueListCell.identifier, for: indexPath) as! IssueListCell
        cell.setIssueListCell(by: list[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension IssueListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = IssueDetailViewController.viewController(from: .github)
        detailVC.issue = list[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let _ = list[indexPath.row].empty {
            return nil
        }
        return indexPath
    }
}
