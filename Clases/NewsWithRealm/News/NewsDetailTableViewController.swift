//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by IMPESA S.A on 5/23/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit


protocol NewsDetailTableViewControllerDelegate: class {
    func addNews(news: News)
}


class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var entradaTitleTextField: UITextField!
    @IBOutlet weak var entradaTextView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var categoryType = 0
    
    weak var delegate: NewsDetailTableViewControllerDelegate?
    
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
        RealmManager.createNews(categoryType: categoryType, title: entradaTitleTextField.text!, description: descriptionTextView.text!)
        
        //navigationController?.pushViewController("", animated: true)
    }
}
