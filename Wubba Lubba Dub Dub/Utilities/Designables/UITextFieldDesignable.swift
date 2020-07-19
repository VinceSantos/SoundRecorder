//
//  UITextFieldDesignable.swift
//  ERP-iOS
//
//  Created by Vince Carlo Santos on 23/01/2020.
//  Copyright © 2020 MVP Asia Pacific. All rights reserved.
//

import UIKit

class UITextFieldDesignable: UITextField {
    var isSetRound = false

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var placeHolderColor: UIColor = .white {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    @IBInspectable var isRound: Bool = false {
        didSet {
            self.isSetRound = isRound
        }
    }
    
    @IBInspectable var leftPadding: Int = 0 {
        didSet {
            self.setLeftPaddingPoints(CGFloat(leftPadding))
        }
    }
    
    override func draw(_ rect: CGRect) {
        if isSetRound == true {
            self.setRoundView()
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
