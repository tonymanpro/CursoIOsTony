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
    var myImageViewData: UIImageView?
    let myPickerController = UIImagePickerController()
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
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
        
        if (myImageViewData?.image) != nil {
            
            let imageData = UIImagePNGRepresentation((myImageViewData?.image)!)
            
            RealmManager.addDogs(name: nameTextField.text!, imageName: imageData! as NSData , color: colorTextField.text!)
            
        }else {
            print("se desmadro tere")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        myPickerController.sourceType = .photoLibrary
        myPickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(myPickerController,animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageViewData?.image = image
            myImageView.image = image
        }else {
            print("se desmadro tere")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
