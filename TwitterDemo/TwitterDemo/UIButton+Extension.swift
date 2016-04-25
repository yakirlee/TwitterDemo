//
//  UIButton+Extension.swift
//  TwitterDemo
//
//  Created by Yakir on 16/4/25.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(ykImageName imageName: String?,
                                 title: String?,
                                 color: UIColor = UIColor.blackColor()
        ) {
        self.init()
        
        self.setTitle(title, forState: .Normal)
        self.setTitleColor(color, forState: .Normal)
        guard let imageName = imageName else {
            return
        }
        
        self.setImage(UIImage(named: imageName), forState: .Normal)
        self.setImage(UIImage(named: "\(imageName) + _Highlighted"), forState: .Highlighted)
        self.setImage(UIImage(named: "\(imageName) + _Selected"), forState: .Selected)
    }
}
