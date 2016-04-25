//
//  CellStatusView.swift
//  TwitterDemo
//
//  Created by Yakir on 16/4/25.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

private let margin = 10.0
class CellStatusView: UIView {

    private lazy var nameLabel = UILabel(ykText: "名字",fontSize: 16, color: UIColor.blackColor())
    private lazy var accountLabel = UILabel(ykText: "@realName",fontSize: 13)
    private lazy var headView = UIImageView(ylImageName: "ic_tweet_attr_summary_default")
    private lazy var timeLabel = UILabel(ykText: "10/8/2015", fontSize: 12, color: UIColor.darkGrayColor(), alignment: .Left)
    private lazy var mainLabel = UILabel(ykText: "一大串的Twitter发布数据一大串的Twitter发布数据一大串的Twitter发布数据一大串的Twitter发布数据一大串的Twitter发布数据", fontSize: 15, color: UIColor.blackColor(), alignment: .Left)
    private lazy var picViews = PictureView(frame: CGRectZero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI设计
extension CellStatusView {
    func setupUI() {
        
        // 测试数据
        headView.ylSetImageWithUrl("http://pbs.twimg.com/profile_images/473830458556297216/40KlXkaR_normal.jpeg", placeholderName: "ic_tweet_attr_summary_default", size: CGSizeMake(50, 40), corner: 4)
        
        addSubview(headView)
        addSubview(nameLabel)
        addSubview(accountLabel)
        addSubview(timeLabel)
        addSubview(mainLabel)
        addSubview(picViews)
        
        headView.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.top.equalTo(self).offset(margin)
            make.size.equalTo(CGSizeMake(50, 50))
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(headView.snp_right).offset(margin)
            make.top.equalTo(headView)
        }
        nameLabel.sizeToFit()
        
        accountLabel.snp_makeConstraints { (make) in
            make.top.equalTo(headView).offset(2)
            make.left.equalTo(nameLabel.snp_right).offset(2)
        }
        accountLabel.sizeToFit()
        
        timeLabel.snp_makeConstraints { (make) in
            make.right.equalTo(self).offset(-margin)
            make.top.equalTo(headView)
        }
        
        mainLabel.snp_makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp_bottom).offset(margin)
            make.right.equalTo(self).offset(-margin)
        }
        mainLabel.sizeToFit()
        
        picViews.snp_makeConstraints { (make) in
            make.left.equalTo(mainLabel)
            make.top.equalTo(mainLabel.snp_bottom).offset(margin)
            make.right.equalTo(mainLabel)
            make.bottom.equalTo(self)
        }
    }
}