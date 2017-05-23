//
//  EnterNumberViewController.swift
//  Quiz3
//
//  Created by IMPESA S.A on 5/23/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {

    
    @IBOutlet weak var textNumber: UITextField!
    @IBOutlet weak var butonNumber: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func insetButon(_ sender: Any) {
    
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NumbersTableViewController"))!
            as! NumbersTableViewController
        
        nameViewController.arrayNumber.append(textNumber.text!)
        
    }
 

}
