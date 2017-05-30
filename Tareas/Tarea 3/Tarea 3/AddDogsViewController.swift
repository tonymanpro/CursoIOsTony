//
//  AddDogsViewController.swift
//  Tarea 3
//
//  Created by IMPESA S.A on 5/28/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class AddDogsViewController: UIViewController,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    var myImageView: UIImageView?
    let myPickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerController.delegate = self
        addSaveNews()
    }
    
    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action:
            #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        
        var data = UIImagePNGRepresentation((myImageView?.image)!) as NSData?
        
        RealmManager.addDogs(name: nameTextField.text!, imageName: data! , color: colorTextField.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        myPickerController.sourceType = .photoLibrary
        present(myPickerController,animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        myImageView?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
