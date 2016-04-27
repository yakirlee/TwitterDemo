//
//  PictureView.swift
//  TwitterDemo
//
//  Created by Yakir on 16/4/25.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

private let picImageCount = 1
class PictureView: UIView {
    
    
    var picImageUrl:String? {
        
        didSet {
            let imageView =  subviews.first as? UIImageView
            guard let picImageUrl = picImageUrl else {
                imageView?.hidden = true
                return
            }
            imageView?.sd_setImageWithURL(NSURL(string: picImageUrl))
        }
    }
    //MARK: - 私有控件
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PictureView {
    
    func setupUI() {
        
        let margin = 4
        let width = (UIScreen.mainScreen().bounds.width - CGFloat((picImageCount - 1) * margin)) / CGFloat(picImageCount)
        let height = width
        for i in 0..<picImageCount {
            
            let row = i % 2
            let col = i / 2
            let picView = UIButton()
            picView.hidden = false
            picView.clipsToBounds = true
            picView.tag = i
            picView.backgroundColor = UIColor.redColor()
            
            addSubview(picView)
            picView.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(CGFloat(row) * (width + CGFloat(margin)))
                make.top.equalTo(CGFloat(col) * (height + CGFloat(margin)))
                make.size.equalTo(CGSizeMake(width, height))
                if i == picImageCount - 1 {
                    make.bottom.equalTo(self)
                }
            })
        }
    }
}
