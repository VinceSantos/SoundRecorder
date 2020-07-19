//
//  UIButtonDesignable.swift
//  ERP-iOS
//
//  Created by Vince Carlo Santos on 23/01/2020.
//  Copyright © 2020 MVP Asia Pacific. All rights reserved.
//

import UIKit

@IBDesignable class UIButtonDesignable: UIButton {
    var isSetRound = false
    
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
        }
    }
    
    @IBInspectable var isRound: Bool = false {
        didSet {
            self.isSetRound = isRound
        }
    }
    
    override func draw(_ rect: CGRect) {
        if isSetRound == true {
            self.setRoundView()
        }
    }
}
