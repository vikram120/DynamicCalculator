//
//  UIView+Extension.swift
//  DynamicCalculator
//
//  Created by Vikram Kunwar on 12/09/23.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
        
        
        
        
    }
    
    @IBInspectable var shadow: CGFloat {
        get {return shadow}
        set{
            self.layer.cornerRadius = newValue
        }
        
        
        
        
    }
    
    @IBInspectable var borderColor: CGColor {
        get {return borderColor}
        set{
            self.layer.borderColor = newValue
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {return borderWidth}
        set{
            self.layer.borderWidth = newValue
        }
        
    }
    
    
    
    
        
        
        
        
    
}

