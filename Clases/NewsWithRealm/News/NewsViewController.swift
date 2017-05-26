//
//  NewsViewController.swift
//  News
//
//  Created by Cesar Brenes on 5/18/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import RealmSwift


protocol NewsViewControllerDelegate: class {
    //func addNews(news: [News], categoriType: CategoryType)
}

class NewsViewController: UIViewController {
    
    var news: List<News>?
    var categoryType = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: NewsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NewsTableViewCell.getTableViewCellIdentifier())
        createAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       news = RealmManager.getAllNews(categoryType: categoryType)
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
        NewsDetailTableViewController.getViewControllerIdentifier()) as!
            NewsDetailTableViewController
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getTableViewCellIdentifier()) as! NewsTableViewCell
        cell.setupCell(news: news![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


extension NewsViewController: NewsDetailTableViewControllerDelegate{
    func addNews(news: News){
        self.news?.append(news)
        tableView.reloadData()
    }
}






