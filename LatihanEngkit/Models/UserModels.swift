//
//  UserModels.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 23/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let userName: String
    let NIM: Int
    
    init(userName: String, NIM: Int) {
        
        self.userName = userName
        self.NIM = NIM
    }
    
}
