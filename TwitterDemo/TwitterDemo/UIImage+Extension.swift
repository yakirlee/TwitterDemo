//
//  UIImage+Extension.swift
//  TwitterDemo
//
//  Created by 李 on 16/4/24.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

extension UIImage {
    
    ///  异步绘制图片
    ///
    ///  - parameter size:      图片大小
    ///  - parameter corner:    裁剪的圆角大小，默认为0不裁剪
    ///  - parameter backColor: 图片背景色
    ///  - parameter finished:  完成闭包
    func ylAsyncDrwaImage(size: CGSize,
                          corner: CGFloat = 0,
                          backColor: UIColor? = UIColor.whiteColor(),
                          finished: (image:UIImage) -> ()) {
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            UIGraphicsBeginImageContextWithOptions(size, backColor != nil, UIScreen.mainScreen().scale)
            let rect = CGRect(origin: CGPointZero, size: size)
            backColor?.setFill()
            UIRectFill(rect)
            if corner > 0 {
                let path = UIBezierPath(roundedRect: rect, cornerRadius: corner)
                path.addClip()
            }
            self.drawInRect(rect)
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            dispatch_async(dispatch_get_main_queue(), { 
                finished(image: result)
            })
        }
        
    }
    }
