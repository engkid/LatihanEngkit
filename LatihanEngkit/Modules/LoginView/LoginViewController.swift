//
//  LoginViewController.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 12/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import UIKit

protocol ILoginViewController: class {
    
    func setupView()
    func configureViewWithModel(_ userModel: [User]?)
    
}

class LoginViewController: UIViewController, ILoginViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel?
    @IBOutlet weak var nextButton: UIButton?
    @IBOutlet weak var textureViewButton: UIButton?
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidloaded()
    }
    
    //MARK: ILoginViewController protocol methods
    func setupView() {
        self.navigationItem.title = "iOS Programming Newbs"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.nextButton?.addTarget(self, action: #selector(nextViewController), for: .touchUpInside)
        self.textureViewButton?.addTarget(self, action: #selector(textureViewController), for: .touchUpInside)
        print("viewController setupView called")
    }
    
    func configureViewWithModel(_ userModel: [User]?) {
        let gridPresenter: GridViewPresenter = GridViewPresenter()
        GridViewPresenter.presenterClassFunc()
        let setring: String = GridViewController.iniMethodKelasGrid()
        print(setring)
        
        var userNames: [String] = []
        
        if let users = userModel {
            
            for user in users {
                userNames.append(user.userName)
            }
            
            self.welcomeLabel?.text = "Welcome, \(userNames.joined(separator: " and ")) ! ! !"
        }
        
    }
    
    //MARK: Router
    @objc func textureViewController() {
        presenter?.navigateToTextureModule(from: self)
        
    }
    
    @objc func nextViewController() {
        presenter?.navigateToNextModule(from: self)
    }
    
}
