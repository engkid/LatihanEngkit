//
//  NetworkService.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 23/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: [User]?, _ response: URLResponse?, _ error: NSError?) -> (Void)

protocol INetworkService: class {
    
    func request(_ url: String, _ parameter: [String:Any], completion: @escaping NetworkRouterCompletion)
    
}

class NetworkService: INetworkService {
    
    func request(_ url: String, _ parameter: [String:Any], completion: @escaping NetworkRouterCompletion) {
        
        //TODO: Decide what to use... Native Networking Serivce or Third party networking library?
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/posts"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error as NSError? {
                    completion(nil, nil, error)
                } else if let responseData = data {
                    
                    let decoder: JSONDecoder = JSONDecoder()
                    
                    do {
                        
                        let decode = try decoder.decode([User].self, from: responseData)
                        completion(decode, nil, nil)
                        
                        
                    } catch {
                        
                        completion(nil, nil, error as NSError)
                        
                    }
                }
            }
        }
        
        task.resume()
        
        let users = [
            User(userName: "Engkit Satia Riswara", NIM: 1),
            User(userName: "Windy Novita Wulandari", NIM: 2)
        ]
        
        completion(users, nil, nil)
    }
    
}
