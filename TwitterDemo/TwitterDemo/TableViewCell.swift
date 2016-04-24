//
//  TableViewCell.swift
//  TwitterDemo
//
//  Created by 李 on 16/4/24.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit
import SnapKit

private let margin = 10.0

class TableViewCell: UITableViewCell {
    
    private lazy var nameLabel = UILabel(ykText: "名字")
    private lazy var accountLabel = UILabel(ykText: "@realName")
    private lazy var headView = UIImageView(ylImageName: "ic_tweet_attr_summary_default")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}


// MARK: - UI设计
extension TableViewCell {
    func setupUI() {
        
        // 测试数据
        headView.ylSetImageWithUrl("http://pbs.twimg.com/profile_images/473830458556297216/40KlXkaR_normal.jpeg", placeholderName: "ic_tweet_attr_summary_default", size: CGSizeMake(50, 40), corner: 4)
        
        
        
        contentView.addSubview(headView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(accountLabel)
        
        headView.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(margin)
            make.top.equalTo(contentView).offset(margin)
            make.size.equalTo(CGSizeMake(30, 30))
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(headView.snp_right).offset(margin)
            make.top.equalTo(headView)
        }
        nameLabel.sizeToFit()
        
        accountLabel.snp_makeConstraints { (make) in
            make.top.equalTo(headView)
            make.left.equalTo(nameLabel.snp_right)
        }
        accountLabel.sizeToFit()
        
        
       
    }
}
