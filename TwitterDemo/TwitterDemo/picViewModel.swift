//
//  picViewModel.swift
//  TwitterDemo
//
//  Created by Yakir on 16/4/27.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit
import SDWebImage

class picViewModel: NSObject {
    
    private func calcSinglePicturesViewSize(picUrl: String) -> CGSize {
        
        guard let image = SDWebImageManager.sharedManager().imageCache.imageFromDiskCacheForKey(picUrl) else {
            return CGSizeZero
        }
        let scale = UIScreen.mainScreen().scale
        var size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        // 针对过窄或者过宽的图片处理
        let minWidth: CGFloat = 20
        let maxWidth: CGFloat = 300
        // 如果宽度过小，将宽度调整到20
        size.width = size.width < minWidth ? minWidth : size.width
        if size.width > maxWidth {
            // 等比例缩放
            size.width = maxWidth
            size.height = size.width * image.size.height / image.size.width
        }
        return size
    }


}
