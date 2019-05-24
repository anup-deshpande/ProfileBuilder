//
//  UpdateDeptViewController.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class UpdateDeptViewController: UIViewController {

    var user:User?
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if user != nil{
            if user?.department == "CS"{
                segmentControl.selectedSegmentIndex = 0
            }else if user?.department == "SIS" {
                segmentControl.selectedSegmentIndex = 1
            }else if user?.department == "BIO"{
                segmentControl.selectedSegmentIndex = 2
            }
        }else{
            print("Something is not filled")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CancelUnwind"{
            print("Cancel Unwind")
        }
        
        if segue.identifier == "UpdateDeptUnwind"{
            print("Update Department Unwind")
            if segmentControl.selectedSegmentIndex != -1{
                
                if segmentControl.selectedSegmentIndex == 0{
                    user?.department = "CS"
                }else if segmentControl.selectedSegmentIndex == 1{
                  user?.department = "SIS"
                }else if segmentControl.selectedSegmentIndex == 2 {
                 user?.department = "BIO"
                }
                
                
                let userToPass = segue.destination as! ProfileViewController
                userToPass.user = self.user
            }
        }
    }
    


}
