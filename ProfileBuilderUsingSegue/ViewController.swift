//
//  ViewController.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProfileSegue"{
            
            let canGoForward = isEverythingFilled()
            if canGoForward == true{
             
                var department = ""
                if segmentedControl.selectedSegmentIndex == 0{
                    department = "CS"
                }else if segmentedControl.selectedSegmentIndex == 1{
                    department = "SIS"
                }else if segmentedControl.selectedSegmentIndex == 2{
                    department = "BIO"
                }
                
                let userToPass = User(name: nameTextField.text!, email:emailTextField.text!, password: passTextField.text!,department: department)
                
                let destination = segue.destination as! ProfileViewController
                destination.user = userToPass
                
                
            }
        }
    }
    
    func isEverythingFilled() -> Bool{
        var errors = ""
        var valueToReturn = true
        
        if nameTextField.text == ""{
            errors.append("\nname")
            valueToReturn = false
        }
        
        if emailTextField.text == ""{
            errors.append("\nemail")
            valueToReturn = false
        }
        
        if passTextField.text == ""{
            errors.append("\npassword")
            valueToReturn = false
        }
        
        if segmentedControl.selectedSegmentIndex == -1{
            errors.append("\nDepartment")
            valueToReturn = false
        }
        
        if valueToReturn == false{
            let alert = UIAlertController(title: "Please Fill the Following", message: errors, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }else{
            return true
        }
        
       return true
        
    }
    
    @IBAction func myUnwindActionForProfile(unwindSegue: UIStoryboardSegue){
        
    }

}

