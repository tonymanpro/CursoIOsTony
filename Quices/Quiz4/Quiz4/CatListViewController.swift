//
//  CatListViewController.swift
//  Quiz4
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import RealmSwift

class CatListViewController: UIViewController {

    var cats: Results<Cats>?
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: AddCatViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: CatCustomTableViewCell.getTableViewCellIdentifier())
        createAddButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cats = RealmManager.getAllCatsResult()
        tableView.reloadData()
    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                        action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        //Llamado a otra vista
        let viewController = storyboard!.instantiateViewController(withIdentifier:
            AddCatViewController.getViewControllerIdentifier()) as!
        AddCatViewController
        //viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}



extension CatListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard cats != cats else {
            return 0
        }
        return cats!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCustomTableViewCell.getTableViewCellIdentifier()) as! CatCustomTableViewCell
        cell.setupCell(cat: cats![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}










