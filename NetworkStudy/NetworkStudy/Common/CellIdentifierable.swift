//
//  CellIdentifierable.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import UIKit

protocol CellIdentifierable { }

extension CellIdentifierable where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellIdentifierable { }
