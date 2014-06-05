//
//  ViewController.swift
//  MyFirstSwiftProject
//
//  Created by Ron on 4/6/14.
//  Copyright (c) 2014 HGG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var yellowView : UIView
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidDisappear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func segmentedControl(sender : AnyObject) {
    
        
        let control:UISegmentedControl = sender as UISegmentedControl;
        
        
        if(control.selectedSegmentIndex == 0){
            if let widthConstraint = yellowView.widthConstraint(){
                widthConstraint.constant = 100
            }
        }else {
            if let widthConstraint = yellowView.widthConstraint(){
                widthConstraint.constant = 200
            }
        }

        UIView.beginAnimations(nil, context: nil)
        UIView.animateWithDuration(0.5, animations: nil)
        self.view.layoutIfNeeded()
        UIView.commitAnimations()
    }

}

