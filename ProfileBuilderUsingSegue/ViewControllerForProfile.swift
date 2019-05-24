//
//  ViewControllerForProfile.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var showHideButton: UIButton!
    
    var user:User?
    var actualPassword:String?
    var passwordToShow=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user != nil{
            NameLabel.text = user?.name
            emailLabel.text = user?.email
            departmentLabel.text = user?.department
            actualPassword = user?.password
            for _ in actualPassword!{
                passwordToShow.append("*")
            }
            passwordLabel.text = passwordToShow
            
        }else{
         print("Something is not filled")
        }
    }
    @IBAction func showClicked(_ sender: UIButton){
        
        if sender.title(for: UIControl.State.normal) == "Show"{
            showHideButton.setTitle("Hide", for: UIControl.State.normal)
            passwordToShow = actualPassword!
            passwordLabel.text = passwordToShow
        }else if sender.title(for: UIControl.State.normal) == "Hide"{
            showHideButton.setTitle("Show", for: UIControl.State.normal)
            passwordToShow = ""
            for _ in actualPassword!{
                passwordToShow.append("*")
            }
            passwordLabel.text = passwordToShow
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditNameSegue" {
            let userInDestination = segue.destination as! EditNameViewController
            userInDestination.user = self.user
        }
        
        if segue.identifier == "showEditPasswordSegue" {
            let userInDestination = segue.destination as! UpdatePassViewController
            userInDestination.user = self.user
        }
        
        if segue.identifier == "showEditDeptSegue" {
            let userInDestination = segue.destination as! UpdateDeptViewController
            userInDestination.user = self.user
        }
    }
    
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        if unwindSegue.identifier == "UpdateNameUnwind"{
        NameLabel.text = user?.name
        }
        
        if unwindSegue.identifier == "UpdatePassUnwind"{
            actualPassword = user?.password
            passwordToShow = ""
            for _ in actualPassword!{
                passwordToShow.append("*")
            }
            passwordLabel.text = passwordToShow
        }
        
        if unwindSegue.identifier == "UpdateDeptUnwind"{
            departmentLabel.text = user?.department
        }
        
        
        
    }


}
