//
//  LoginWireframe.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 22/12/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import UIKit

protocol ILoginWireframe: class {
    
    func presentCatalogModule(from sourceView: UIViewController)
    func presentNextModule(from sourceView: UIViewController)
    
}

class LoginWireframe: ILoginWireframe {
    
    func presentCatalogModule(from sourceView: UIViewController) {
        let catalogViewController = CatalogViewController()
        
        sourceView.navigationController?.pushViewController(catalogViewController, animated: true)
    }
    
    func presentNextModule(from sourceView: UIViewController) {
        let gridPresenter = GridViewPresenter()
        let gridViewController = GridViewController(presenter: gridPresenter)
        gridPresenter.view = gridViewController
        
        sourceView.navigationController?.pushViewController(gridViewController, animated: true)
    }

}
