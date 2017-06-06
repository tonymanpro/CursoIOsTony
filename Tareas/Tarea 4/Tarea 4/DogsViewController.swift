//
//  DogsViewController.swift
//  Tarea 4
//
//  Created by IMPESA S.A on 6/4/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    var dogs: [Dogs]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: DogTableViewCell.getTableViewCellIdentifier())
        createAddButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dogs = CoreDataManager.getAllDogs()
        tableView.reloadData()
    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddDogViewController.getViewControllerIdentifier()) as! AddDogViewController
        viewController.dogs = dogs
        navigationController?.pushViewController(viewController, animated: true)
    }

}



extension DogsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dogs = dogs else {
            return 0
        }
        return dogs.count
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






