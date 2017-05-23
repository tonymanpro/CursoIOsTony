//
//  Helper.swift
//  Tarea 2
//
//  Created by IMPESA S.A on 5/22/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCustomCell(indetifier: String) {
        let nib  = UINib(nibName: indetifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: indetifier)
    }
}

extension UITableViewCell{
    class func getCellIdentifier()-> String{
        return String(describing: self)
    }
}
