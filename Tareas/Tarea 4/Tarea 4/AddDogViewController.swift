//
//  AddDogViewController.swift
//  Tarea 4
//
//  Created by IMPESA S.A on 6/4/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var dogs: [Dogs]?

    @IBOutlet weak var bameTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var myImageViewData: UIImageView!
    
    
    @IBOutlet weak var randomPhotoButton: UIButton!
    @IBOutlet weak var selectPhotoButton: UIButton!

    let myPickerController = UIImagePickerController()
    var imageExample = UIImage()
    
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
            CoreDataManager.createDog(dogName: bameTextField.text!, dogColor: colorTextField.text!, imageName: (imageExample.accessibilityIdentifier)! )
        }else {
            print("se desmadro tere")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomPhotoButton(_ sender: Any) {
        let numbre = Int32.random(lower: 1, upper: 5)
        CoreDataManager.createDog(dogName: bameTextField.text!, dogColor: colorTextField.text!, imageName: "dog0" + String(numbre))
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        myPickerController.sourceType = .photoLibrary
        myPickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageViewData?.image = image
            imageExample = image
        }else {
            print("se desmadro tere")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}


public extension Int32 {
    public static func random(lower: Int32 = min, upper: Int32 = max) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}


