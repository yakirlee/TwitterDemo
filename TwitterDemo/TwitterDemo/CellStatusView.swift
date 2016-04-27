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
    
    var user: User? {
        didSet {
            
            picView.image = nil
            nameLabel.text = user?.name
            accountLabel.text = "@" + (user?.screen_name)! ?? ""
            headView.ylSetImageWithUrl(user?.profile_image_url, placeholderName: "ic_tweet_attr_summary_default", size: CGSizeMake(50, 40), corner: 4)
            // TODO: - 时间处理
            // timeLabel.text = user?.created_at
            mainLabel.text = user?.desc
            guard let imageUrl = user?.profile_banner_url else {
                return
            }
            print(imageUrl)
            picView.sd_setImageWithURL(NSURL(string: imageUrl))
            if ((picView.image) != nil) {
                picView.contentMode = .ScaleAspectFit
                let picW = bounds.width / 2
                let picH = 60
                picView.snp_updateConstraints { (make) in
                    make.width.equalTo(picW)
                    make.height.equalTo(picH)
                }
            }
            
            /// 设置字体跟背景颜色
            /*
             let textBack = (user?.profile_text_color)! ?? "000000"
             mainLabel.textColor = UIColor(hexString: textBack)
             let backColor =  (user?.profile_background_color)! ?? "000000"
             backgroundColor = UIColor(hexString: backColor)
             let backImage = UIImageView()
             backImage.ylSetImageWithUrl(user?.profile_background_image_url, placeholderName: nil)
             guard let image = backImage.image else {
             return
             }
             insertSubview(backImage, atIndex: 0)
             backImage.snp_makeConstraints { (make) in
             make.top.equalTo(self)
             make.right.equalTo(self)
             make.left.equalTo(self)
             }
             backImage.clipsToBounds = true
             */
        }
    }
    
    // MARK: - 私有控件
    private lazy var nameLabel    = UILabel(ykText: "名字",fontSize: 16, color: UIColor.blackColor())
    private lazy var accountLabel = UILabel(ykText: "@realName",fontSize: 13)
    private lazy var headView     = UIImageView(ylImageName: "ic_tweet_attr_summary_default")
    private lazy var timeLabel    = UILabel(ykText: "10/8/2015", fontSize: 12, color: UIColor.darkGrayColor(), alignment: .Left)
    private lazy var mainLabel    = UILabel(ykText: "一大串的Twitter发布数据", fontSize: 14, color: UIColor.lightGrayColor(), alignment: .Left)
    // 多图
    // private lazy var picViews = PictureView(frame: CGRectZero)
    private lazy var picView = UIImageView(frame: CGRectZero)
    
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
        // headView.ylSetImageWithUrl("http://pbs.twimg.com/profile_images/473830458556297216/40KlXkaR_normal.jpeg", placeholderName: "ic_tweet_attr_summary_default", size: CGSizeMake(50, 40), corner: 4)
        
        addSubview(headView)
        addSubview(nameLabel)
        addSubview(accountLabel)
        addSubview(timeLabel)
        addSubview(mainLabel)
        addSubview(picView)
        
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
        
        picView.snp_makeConstraints { (make) in
            make.left.equalTo(mainLabel)
            make.top.equalTo(mainLabel.snp_bottom).offset(margin)
            make.bottom.equalTo(self)
        }
    }
}