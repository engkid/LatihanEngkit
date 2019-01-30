//
//  CatalogViewController.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 28/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CatalogViewController: ASViewController<ASTableNode>, ASTableDelegate, ASTableDataSource, UIGestureRecognizerDelegate {
    
    let objects: [String] = ["abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]
    let fab = ASButtonNode()

    init() {
        super.init(node: ASTableNode())
        
        self.title = "This is Texture View"
        
        node.delegate = self
        node.dataSource = self
        self.drawFAB()
    }
    
    private func drawFAB() {
        let screenSize = UIScreen.main.bounds
        
        let image = ASImageNode()
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.image = UIImage(named: "fab_icon")
        image.layer.cornerRadius = 25
        
        let segmentedControl = UISegmentedControl()
//        segmentedControl.frame = CGRect(x: (self.view.center.x / 2) - 16, y: 16, width: screenSize.width - 64, height: 60)
        segmentedControl.backgroundColor = .blue
        
        self.fab.frame = CGRect(x: screenSize.width - 66, y: screenSize.height - 136, width: 50, height: 50)
        self.fab.addTarget(self, action: #selector(fabTapped), forControlEvents: .touchUpInside)
        self.fab.addSubnode(image)
        self.fab.layer.cornerRadius = 25
        self.fab.layer.masksToBounds = true
        
        self.node.addSubnode(fab)
        self.view.addSubview(segmentedControl)

    }
    
    @objc private func fabTapped() {
        var currentTransform = CATransform3DIdentity
        UIView.animate(withDuration: 0.3) {
            
            currentTransform = CATransform3DMakeScale(0.5, 0.5, 1)
            
            self.fab.layer.transform = currentTransform
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("View is not compatible with texture")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = self.node.indexPathForSelectedRow {
            self.node.deselectRow(at: selectedIndexPath, animated: false)
        }
    }
    
    //MARK: ASTableNodeDataSource
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = ASTextCellNode()
            cellNode.text = self.objects[indexPath.row].capitalized
            
            return cellNode
        }
        
        return cellNodeBlock
    }
    
    //MARK: ASTableNodeDelegate
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let category = objects[indexPath.row]
//        let detailRootNode = DetailRootNode(category: category)
//        let detailViewController = DetailViewController(node: detailRootNode)
//        detailViewController.title = category.capitalized
        
        print("selected category => \(category)")
        
//        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
