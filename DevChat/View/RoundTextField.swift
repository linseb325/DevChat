//
//  RoundTextField.swift
//  DevChat
//
//  Created by Brennan Linse on 2/17/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit

@IBDesignable class RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0  // If we're using rounded corners, turn on masksToBounds.
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let attributedStr = NSAttributedString(string: rawString, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor!])
            attributedPlaceholder = attributedStr
        }
    }
    
    
}
