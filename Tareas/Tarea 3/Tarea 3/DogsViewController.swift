//
//  DogsViewController.swift
//  Tarea 3
//
//  Created by IMPESA S.A on 5/28/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import RealmSwift

class DogsViewController: UIViewController {

    var dogs: List<Dogs>?
    
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: AddDogsViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: DogTableViewCell.getTableViewCellIdentifier())
        createAddButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dogs = RealmManager.getAllDogs()
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                        action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        //Llamado a otra vista
        let viewController = storyboard!.instantiateViewController(withIdentifier:
            AddDogsViewController.getViewControllerIdentifier()) as!
        AddDogsViewController
        //viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

}


extension DogsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard dogs != dogs else {
            return 0
        }
        return dogs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getTableViewCellIdentifier()) as! DogTableViewCell
        cell.setupCell(dog: dogs![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}




