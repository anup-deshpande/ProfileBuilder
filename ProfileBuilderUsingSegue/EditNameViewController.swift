//
//  EditNameViewController.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class EditNameViewController: UIViewController {

    var user:User?
    @IBOutlet weak var NameLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if user != nil{
            NameLabel.text = user?.name
        }else{
            print("Something is not filled")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CancelUnwind"{
            print("Cancel Unwind")
        }
        
        if segue.identifier == "UpdateNameUnwind"{
            print("Update Unwind")
            if NameLabel.text != ""{
                user?.name = NameLabel.text
                let userToPass = segue.destination as! ProfileViewController
                userToPass.user = self.user
            }
        }
    }

}
