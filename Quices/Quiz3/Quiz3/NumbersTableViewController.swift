//
//  NumbersTableViewController.swift
//  Quiz3
//
//  Created by IMPESA S.A on 5/23/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class NumbersTableViewController: UITableViewController {

    var arrayNumber = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return arrayNumber.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell.getCellIdentifier(), for: indexPath) as! NumberCustomCell
        
        // Configure the cell...
        cell.displayNumberLabel.text = "\(arrayNumber[indexPath.row] ?? "")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
