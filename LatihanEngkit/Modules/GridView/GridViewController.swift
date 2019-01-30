//
//  GridViewController.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 26/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    
    var presenter: GridViewPresenter?

    init(presenter: GridViewPresenter) {
        super.init(nibName: "GridViewController", bundle: Bundle.main)
        self.presenter = presenter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidloaded()
    }
    
    class func iniMethodKelasGrid() -> String {
        return "ini method kelas gridviewcontroller"
    }

}
