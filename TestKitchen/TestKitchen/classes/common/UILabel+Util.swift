//
//  UILabel+Util.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/15.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit

extension UILabel {
    
    class func createLabel(text: String?, font: UIFont?, textAlignment: NSTextAlignment?, textColor: UIColor?) -> UILabel {
        
        let label = UILabel()
        if let labelText = text {
            label.text = labelText
        }
        
        if let labelFont = font {
            label.font = labelFont
        }
        
        if let labelAlign = textAlignment {
            label.textAlignment = labelAlign
        }
        
        if let labelTextColor = textColor {
            label.textColor = labelTextColor
        }
        
        return label
    }
    
}
