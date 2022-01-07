//
//  UIView+Extension.swift
//  NetworkStudy
//
//  Created by JH on 2022/01/07.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
