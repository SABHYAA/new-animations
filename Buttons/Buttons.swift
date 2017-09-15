//
//  Buttons.swift
//  Buttons
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Buttons: UIViewController {
    
    
    enum animation {
        case left
        case right
        case top
        case none
    }
    
    @IBOutlet weak var buttonleadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var slideme: UIButton!
    
    
    var appliedAnimation = animation.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn, animations: {self.buttonleadingConstraint.constant = 230
        }, completion: {(view) -> Void in
            self.view.layoutIfNeeded()
            
        }
        )
    }
    
    
    @IBAction func slidemeBtn(_ sender: UIButton) {
        
        // slide left to right
        let left = CGAffineTransform(translationX: 100-self.buttonleadingConstraint.constant, y: 0)
        let right = CGAffineTransform(translationX: 50, y: 0)
        let top = CGAffineTransform(translationX: 0, y: -300)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            
            if self.appliedAnimation == .right{
                self.slideme.transform = left
                self.appliedAnimation = .left
            }else{
                self.slideme.transform = right
                self.appliedAnimation = .right
            }
            
            
        }, completion: nil)
         // Fade out
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.slideme.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.slideme.alpha = 1.0
            }, completion: nil)
        })
    }}

