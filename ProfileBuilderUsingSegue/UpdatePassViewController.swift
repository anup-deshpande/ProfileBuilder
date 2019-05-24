//
//  UpdatePassViewController.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class UpdatePassViewController: UIViewController {

    var user:User?
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user != nil{
            passwordField.text = user?.password
        }else{
            print("Something is not filled")
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CancelUnwind"{
            print("Cancel Unwind")
        }
        
        if segue.identifier == "UpdatePassUnwind"{
            print("Update Password Unwind")
            if passwordField.text != ""{
                user?.password = passwordField.text
                let userToPass = segue.destination as! ProfileViewController
                userToPass.user = self.user
            }
        }
    }
    
}
