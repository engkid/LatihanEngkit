//
//  LoginPresenter.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 23/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol ILoginPresenter: class {
    
    func viewDidloaded()
    
    //MARK: wireframe
    func navigateToTextureModule(from sourceView: UIViewController)
    func navigateToNextModule(from sourceView: UIViewController)
}

class LoginPresenter: ILoginPresenter {
    
    var view: LoginViewController?
    var interactor: LoginInteractor?
    var wireframe: LoginWireframe?
    
    convenience init(view: LoginViewController, interactor: LoginInteractor, wireframe: LoginWireframe) {
        self.init()
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidloaded() {
        view?.setupView()
        interactor?.fetchData(completionBlock: { (result, response, error) -> (Void) in
            
            if let fetchResult = result {
                self.view?.configureViewWithModel(fetchResult)
            }

        })
    }
    
    func navigateToTextureModule(from sourceView: UIViewController) {
        wireframe?.presentCatalogModule(from: sourceView)
    }
    
    func navigateToNextModule(from sourceView: UIViewController) {
        wireframe?.presentNextModule(from: sourceView)
    }
    
}
