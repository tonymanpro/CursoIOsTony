//
//  ViewController.swift
//  Translate
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class ViewController: UIViewController, NVActivityIndicatorViewable{
    
    @IBOutlet weak var originalLanguageLabel: UILabel!
    @IBOutlet weak var changeLanguageLabel: UILabel!
    
    @IBOutlet weak var originTextView: UITextView!
    @IBOutlet weak var destinationTextView: UITextView!

    var originLanguage: String?
    var destinationLanguage: String?
    
    var languagesArray: [[String: String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        showActivityIndicator()
        ApiManager.getLanguages()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        let backUp = originLanguage
        originLanguage = destinationLanguage
        destinationLanguage = backUp
        updateLangageLabels()
    }
    
    func registerNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(getLanguagesAviable(notification:)),
                                               name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(errorFound),
                                               name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    func getLanguagesAviable(notification: Notification){
        languagesArray = notification.userInfo?[Constants.LANGUAGE_KEY] as? [[String: String]]
        if languagesArray != nil && languagesArray!.count > 0 {
            languagesArray = languagesArray?.sorted { $0[Constants.LANGUAGE_KEY]! < $1[Constants.LANGUAGE_KEY]! }
            hideActivityIndicator()
            print("EL TAMANO DEL ARRAY ES DE \(languagesArray?.count)")        }
        
        else {
            errorFound()
        }
    }
    
    func errorFound(){
        hideActivityIndicator()
        let alert = UIAlertController(title: "Error Found", message: "We found a error try to get lenguage", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getErrorNotification(notification: Notification){
        
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.ballPulseRise)
        }
    }
    
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    
    
    @IBAction func originLenguajeAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.origin)
    }
    
    func presentLanguageController(languageType: Constants.LanguageType){
        let languageViewController = storyboard?.instantiateViewController(withIdentifier: "LanguagesViewController")
            as! LanguagesViewController
        languageViewController.delegado = self
        
        languageViewController.languageType = languageType
        languageViewController.languagesArray = languagesArray!
        
        
        languageViewController.modalPresentationStyle = .overCurrentContext
        present(languageViewController, animated: true, completion:nil)
    }
    
    func selectLanguage(languageType: Constants.LanguageType, language: String)
    {
        
    }
    
    
    @IBAction func destinationLenguajeAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.destination)
    }

    @IBAction func translateButton(_ sender: Any) {
        if originTextView.text!.isEmptyOrWhiteSpace() {
            let alert = UIAlertController(title: "Error Found", message: "Text is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        ApiManager.createTranslate(origininalLanguage: originLanguage!, destinationLanguage: destinationLanguage!,
                                   textToTranslate: originTextView.text!) { (textTranslated) in
        self.hideActivityIndicator()
        self.destinationTextView.text = textTranslated}
    }


    func updateLangageLabels(){
        originalLanguageLabel.text = originLanguage?.uppercased()
        changeLanguageLabel.text = destinationLanguage?.uppercased()
    }
    
}

extension ViewController: LanguagesViewControllerDelegate{
    func ClosePopover() {
        dismiss(animated: true, completion: nil)
    }
    func selectedLanguage(languageType: Constants.LanguageType, languageSelected: String) {
        ClosePopover()
        
        switch languageType {
        case .origin:
            originLanguage = languageSelected
            break
        default:
            destinationLanguage = languageSelected
            break
        }
        
        updateLangageLabels()
    }
}

extension String {
    func isEmptyOrWhiteSpace() -> Bool{
        return self.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
}





