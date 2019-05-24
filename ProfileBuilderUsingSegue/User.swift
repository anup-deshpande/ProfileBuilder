//
//  User.swift
//  ProfileBuilderUsingSegue
//
//  Created by Deshpande, Anup on 5/24/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import Foundation

class User{
    var name:String?
    var email:String?
    var password:String?
    var department:String?
    
    init(name:String,email:String,password:String,department:String) {
        self.name = name
        self.email = email
        self.password = password
        self.department = department
    }
}
