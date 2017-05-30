//
//  AddCatViewController.swift
//  Quiz4
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import RealmSwift

class AddCatViewController: UIViewController {
    
    @IBOutlet weak var nameTextFild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }
    
    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action:
            #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        let exist = RealmManager.validateCat(cat: nameTextFild.text!)
        
        if exist {
            print("ya existe")
        }
        
        RealmManager.addCats(name: nameTextFild.text!)
        
        let viewController = storyboard!.instantiateViewController(withIdentifier:
            CatListViewController.getViewControllerIdentifier()) as!
        CatListViewController
        //viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
