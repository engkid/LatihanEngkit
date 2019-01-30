//
//  GridViewPresenter.swift
//  LatihanEngkit
//
//  Created by Engkit Satia Riswara on 26/11/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import UIKit

class GridViewPresenter {
    
    var view: GridViewController?
    let numViewPerRow = 15
    
    var cells = [String: UIView]()
    
    func viewDidloaded() {
        
//        view?.navigationController?.navigationBar.isHidden = true
        
        
        view?.title = "This is animate view"
        
        let width = (view?.view.bounds.width)! / CGFloat(numViewPerRow)
        
        for j in 0...30 {
            for i in 0...numViewPerRow + 1 {
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view?.view.addSubview(cellView)
                
                let key = "\(i)|\(j)"
                cells[key] = cellView
            }
        }
        
        view?.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
    }
    
    class func presenterClassFunc() {
        
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    var selectedCell: UIView?
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        
        guard let w = view?.view.frame.width, let _ = view?.view.subviews else { return }
        
//        var loopCount = 0
        let location = gesture.location(in: view?.view)
        
        let width = w / CGFloat(numViewPerRow)
            
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        
        let key = "\(i)|\(j)"
        
        guard let cellView = cells[key] else { return }
        
        if (selectedCell != cellView) {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            }, completion: nil)
            
        }
        
        selectedCell = cellView
        
        view?.view.bringSubviewToFront(cellView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
        
//        cellView?.backgroundColor = .white
        
        /*
        for subView in subViews {
                
            if subView.frame.contains(location) {
                subView.backgroundColor = .black
            }
            
            loopCount += 1
            
        }*/
        
    }
    
}
