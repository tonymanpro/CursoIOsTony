//
//  ViewController.swift
//  Tarea1
//
//  Created by IMPESA S.A on 5/15/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NumOneTextField: UITextField!
    @IBOutlet weak var NumTwoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.NumOneTextField.delegate = self;
        self.NumTwoTextField.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var btnSumar: UIButton!
    @IBAction func btnSumar(_ sender: Any) {
        
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))!
            as! NameViewController
        
        if NumOneTextField.text!.isEmpty{
            NumOneTextField.text = "0"
        }
        
        if NumTwoTextField.text!.isEmpty{
            NumTwoTextField.text = "0"
        }
        
        let valor1 : Int = Int(NumOneTextField.text!)!
        let valor2 : Int = Int(NumTwoTextField.text!)!
        
        
        nameViewController.number = valor1 +  valor2
        
        navigationController?.pushViewController(nameViewController, animated: true)
        
    }

    @IBOutlet weak var btnRestar: UIButton!
    @IBAction func btnRestar(_ sender: Any) {
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))!
            as! NameViewController
        
        
        if NumOneTextField.text!.isEmpty{
            NumOneTextField.text = "0"
        }
        
        if NumTwoTextField.text!.isEmpty{
            NumTwoTextField.text = "0"
        }
        
        
        let valor1 : Int = Int(NumOneTextField.text!)!
        let valor2 : Int = Int(NumTwoTextField.text!)!
        
        
        nameViewController.number = valor1 - valor2
        
        navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    @IBAction func btnDividir(_ sender: Any) {
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))!
            as! NameViewController
        
        if NumOneTextField.text!.isEmpty{
            NumOneTextField.text = "0"
        }
        
        if NumTwoTextField.text!.isEmpty{
            NumTwoTextField.text = "1"
        }
        
        let valor1 : Int = Int(NumOneTextField.text!)!
        let valor2 : Int = Int(NumTwoTextField.text!)!
        
        nameViewController.number = valor1 / valor2
        
        navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    @IBAction func btnMultiplicar(_ sender: Any) {
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))!
            as! NameViewController
        
        
        if NumOneTextField.text!.isEmpty{
            NumOneTextField.text = "0"
        }
        
        if NumTwoTextField.text!.isEmpty{
            NumTwoTextField.text = "0"
        }
        
        
        let valor1 : Int = Int(NumOneTextField.text!)!
        let valor2 : Int = Int(NumTwoTextField.text!)!
        
        
        nameViewController.number = valor1 * valor2
        
        navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let charactersSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charactersSet)
    }
    
}

