//
//  UIImageView+Extension.swift
//
//
//  Created by 李 on 16/4/24.
//
//

import UIKit
import SDWebImage

extension UIImageView {
    
    
    ///  用图像名称创建图像
    ///
    ///  - parameter imageName: imageName
    ///
    ///  - returns: UIImageView
    convenience init(ylImageName imageName: String) {
        self.init(image:UIImage(named: imageName))
    }
    
    
    
    ///  UIImageView生成图像
    ///
    ///  - parameter urlString:       urlString
    ///  - parameter placeholderName: placeholderName
    ///  - parameter size:            裁剪图片的大小，默认为CGRectZero，不裁切
    ///  - parameter corner:          裁剪图片的圆角，默认不裁剪
    ///  - parameter backgrondColor:  背景颜色，默认为白色
    func ylSetImageWithUrl(urlString: String?,
                           placeholderName: String?,
                           size: CGSize = CGSizeZero ,
                           corner: CGFloat = 0,
                           backgrondColor: UIColor = UIColor.whiteColor()) {
        
        // 占位图片
        var placeholderImage: UIImage?
        if placeholderName != nil {
            placeholderImage = UIImage(named: placeholderName!)
        }
        // 无链接显示占位图片
        guard let urlString = urlString,
            let url = NSURL(string: urlString) else {
            image = placeholderImage
            return
        }
        if size == CGSizeZero {
            sd_setImageWithURL(url, placeholderImage: placeholderImage)
            return
        }
        
        // 对图像进行裁剪
        sd_setImageWithURL(url, placeholderImage: placeholderImage) { (image, _, _, _) in
            guard let image = image else {
                return
            }
           image.ylAsyncDrwaImage(size, corner: corner, backColor: backgrondColor, finished: { (image) in
                self.image = image
            })
          
        }
    }
}
