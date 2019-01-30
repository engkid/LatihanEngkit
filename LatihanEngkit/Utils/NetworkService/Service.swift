//
//  Service.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 23/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}
