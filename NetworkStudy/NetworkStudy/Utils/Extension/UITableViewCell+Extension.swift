//
//  UITableViewCell+Extension.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.identifier)
    }

    func registerNib<T: UITableViewCell>(_: T.Type) {
        let bundle: Bundle = Bundle(for: T.self)
        let nib: UINib = UINib(nibName: T.identifier, bundle: bundle)

        register(nib, forCellReuseIdentifier: T.identifier)
    }
}
