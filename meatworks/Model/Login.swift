//
//  Login.swift
//  MeatWorks
//
//  Created by fwThanh on 3/5/18.
//  Copyright © 2018 PQT. All rights reserved.
//

import UIKit
import Foundation

class Login: NSObject {
    
    var user_id: String?
    
    convenience init(keys: [String]?, values: [String]?) {
        self.init()
        
        guard let keyArr = keys else {return}
        guard let valueArr = values else {return}
        
        for (index, key) in keyArr.enumerated() {
            if key == "UserID" {
                self.user_id = valueArr[index]
            }
        }
        
    }
}
