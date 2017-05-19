//
//  CategoryViewController.swift
//  News
//
//  Created by IMPESA S.A on 5/18/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var categories = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        // Do any additional setup after loading the view.
    }
    
    
    func initializeCategories(){
        let economuCategory = Category(name: "Economía", image: "economy")
        let sportsCategory = Category(name: "Sports", image: "sports")
        let technologyCatery = Category(name: "Tecnología", image: "technology")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        categories = [economuCategory,sportsCategory,technologyCatery,incidentCategory]
        self.title = "Categorias"
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getTableViewCellIdentifier())
            as! CategoryTableViewCell
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}














