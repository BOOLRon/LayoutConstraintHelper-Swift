//
//  UIView+LayoutConstraintHelper.swift
//  MyFirstSwiftProject
//
//  Created by Ron on 4/6/14.
//  Copyright (c) 2014 HGG. All rights reserved.
//

import UIKit

extension UIView {
    
    func widthConstraint() -> NSLayoutConstraint? {
        let constraints = self.constraints() as NSLayoutConstraint[]
        for constraint in constraints{
            
            if(constraint.firstAttribute == .Width && !constraint.secondItem && constraint.relation == .Equal){
                
                return constraint
                
            }
            
        }
        return nil
    }

    func heightConstraint() -> NSLayoutConstraint? {
        let constraints = self.constraints() as NSLayoutConstraint[]
        for constraint in constraints{
            
            if(constraint.firstAttribute == .Height && !constraint.secondItem && constraint.relation == .Equal){
                return constraint
            }
            
        }
        return nil
    }
    
    
    func top2SupviewConstraintWithTopLayoutGuideOwner(controller:UIViewController) -> NSLayoutConstraint? {
        
        var topLayoutGuide:UILayoutSupport?
        
        if(controller.respondsToSelector(sel_registerName("topLayoutGuide"))){
            topLayoutGuide = controller.topLayoutGuide
        }
        
        let constraints = self.superview.constraints() as NSLayoutConstraint[]
        
        for constraint in constraints{
            
            if(topLayoutGuide){
                if (self.isEqual(constraint.firstItem) && constraint.secondItem.isEqual(topLayoutGuide) && constraint.firstAttribute == .Top && constraint.secondAttribute == .Bottom) {
                    return constraint
                }
            }else if (self.isEqual(constraint.firstItem) && self.superview.isEqual(constraint.secondItem) && constraint.firstAttribute == .Top && constraint.secondAttribute == .Top) {
                return constraint
            }
        }
        return nil
    }
    
    
    func bottom2SupviewConstraintWithBottomLayoutGuideOwner(controller:UIViewController) -> NSLayoutConstraint? {
        
        var bottomLayoutGuide:UILayoutSupport?
        
        if(controller.respondsToSelector(sel_registerName("bottomLayoutGuide"))){
            bottomLayoutGuide = controller.bottomLayoutGuide
        }
        
        let constraints = self.superview.constraints() as NSLayoutConstraint[]
        
        for constraint in constraints{
            
            if(bottomLayoutGuide){
                if (constraint.firstItem.isEqual(bottomLayoutGuide) && self.isEqual(constraint.secondItem) && constraint.firstAttribute == .Top && constraint.secondAttribute == .Bottom) {
                    return constraint
                }
            }else if (constraint.firstItem.isEqual(self.superview) && constraint.secondItem.isEqual(self) && constraint.firstAttribute == .Bottom && constraint.secondAttribute == .Bottom) {
                return constraint
            }
        }
    
        return nil
    }
    
    func left2SupviewConstraint() -> NSLayoutConstraint?{
        let constraints = self.superview.constraints() as NSLayoutConstraint[]
        for constraint in constraints{
            
            if(constraint.firstItem.isEqual(self) && constraint.firstAttribute == .Leading && constraint.secondAttribute == .Leading){
                return constraint
            }
            
        }
        return nil
    }
    
    
    func right2SupviewConstraint() -> NSLayoutConstraint?{
        let constraints = self.superview.constraints() as NSLayoutConstraint[]
        for constraint in constraints{
            
            if(constraint.firstItem.isEqual(self.superview) && self.isEqual(constraint.secondItem) && constraint.firstAttribute == .Trailing && constraint.secondAttribute == .Trailing){
                return constraint
            }
            
        }
        return nil
    }

}


