//
//  Helper.swift
//  Quiz2
//
//  Created by IMPESA S.A on 5/18/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    
    func registerCustomCell(identifier: String){
        
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
}

extension UITableViewCell{
    class func getCellIdentifier() -> String{
        return String(describing: self)
    }
}
