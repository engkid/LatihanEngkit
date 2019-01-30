//
//  AppDelegate.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 12/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.brown
        navigationBarAppearace.barTintColor = UIColor.white
        
        //LoginViewController Object constructor
        let loginVC: LoginViewController = {
            
            let networkService = NetworkService()
            
            let interactor = LoginInteractor(networkService: networkService)
            
            let login = LoginViewController()
            
            let wireframe = LoginWireframe()
            
            let loginPresenter = LoginPresenter(view: login, interactor: interactor, wireframe: wireframe)
            
            login.presenter = loginPresenter
            
            return login
        }()
        
        let loginViewController = self.assembleDependency()
        
        //you can use LoginViewController or loginVC here
        let nav = UINavigationController(rootViewController: loginVC)
        
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    //MARK : LoginViewController dependency injection
    private func assembleDependency() -> LoginViewController {
        
        //initiate LoginInteractor
        let networkService:NetworkService = NetworkService()
        
        let loginInteractor:LoginInteractor = LoginInteractor(networkService: networkService)
        
        //initiate LoginViewController
        let loginViewController:LoginViewController = LoginViewController()
        
        //initiate LoginWireframe
        let loginWireframe:LoginWireframe = LoginWireframe()
        
        let loginPresenter:LoginPresenter = LoginPresenter(view: loginViewController, interactor: loginInteractor, wireframe: loginWireframe)
        
        //initiate LoginPresenter inside loginViewController
        loginViewController.presenter = loginPresenter
        
        return loginViewController
        
    }


}

