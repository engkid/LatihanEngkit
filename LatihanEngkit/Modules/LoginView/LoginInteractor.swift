//
//  LoginInteractor.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 23/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation

typealias NetworkResultBlock = (_ result:[User]?, _ response:URLResponse?, _ error:NSError?) -> (Void)

protocol ILoginInteractor: class {
    
    func fetchData(completionBlock: @escaping (NetworkResultBlock))
}

class LoginInteractor: ILoginInteractor {
    
    var networkService: NetworkService?
    
    convenience init(networkService: NetworkService) {
        self.init()
        self.networkService = networkService
    }
    
    func fetchData(completionBlock: @escaping (NetworkResultBlock)) {
        
        networkService?.request("", [:], completion: { (result, response, error) -> (Void) in
            
            if let _ = error {
                return
            }
            
            completionBlock(result, response, error)
            
        })
        
    }
    
}
