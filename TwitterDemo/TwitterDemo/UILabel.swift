//
//  UILabel.swift
//  TwitterDemo
//
//  Created by 李 on 16/4/24.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(ykText text:String,
                            fontSize: CGFloat = 14,
                            color: UIColor = UIColor.darkGrayColor(),
                            alignment: NSTextAlignment = .Left) {
        
        self.init()
        
        self.text = text
        self.font = UIFont.systemFontOfSize(fontSize)
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = 0

    }
}

