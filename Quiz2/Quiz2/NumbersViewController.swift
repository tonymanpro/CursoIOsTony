//
//  NumbersViewController.swift
//  Quiz2
//
//  Created by IMPESA S.A on 5/18/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numbers = arrayDeNumeros()
        // Do any additional setup after loading the view.
    }
   
}

func arrayDeNumeros() -> [Int]{
    
    var array = [Int]()
    for i in 1...100{
        array.append(i)
    }
    return array
}


extension NumbersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.getCellIdentifier())
            as! CustomTableViewCell
        
        let num = numbers[indexPath.row]
        
        cell.numberLabel.text =  "\(num)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
