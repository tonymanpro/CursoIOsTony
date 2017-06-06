//
//  LanguagesViewController.swift
//  Translate
//
//  Created by IMPESA S.A on 6/1/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

protocol LanguagesViewControllerDelegate: class {
    func ClosePopover()
    func selectedLanguage(languageType: Constants.LanguageType, languageSelected: String)
}

class LanguagesViewController: UIViewController {

    @IBOutlet weak var languagesPickerView: UIPickerView!
    @IBOutlet weak var languageSelected: UIControl!
    
    weak var delegado: LanguagesViewControllerDelegate?
    
    var languageType: Constants.LanguageType?
    var languagesArray = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectButton(_ sender: Any) {        
        let languagesSelect = languagesArray[languagesPickerView.selectedRow(inComponent: 0)]
        delegado?.selectedLanguage(languageType: languageType!, languageSelected: languagesSelect[Constants.DIRS_KEY]!)
        //delegado?.ClosePopover()
    }
}


extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row][Constants.LANGUAGE_KEY]
    }
    
}
