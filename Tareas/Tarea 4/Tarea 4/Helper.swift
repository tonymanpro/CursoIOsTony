//
//  Helper.swift
//  Tarea 4
//
//  Created by IMPESA S.A on 6/4/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func getViewControllerIdentifier() -> String{
        return String(describing: self)
    }
}


extension UITableViewCell{
    class func getTableViewCellIdentifier() -> String{
        return String(describing: self)
    }
}

extension UITableView{
    func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

