//
//  CellActionsView.swift
//  TwitterDemo
//
//  Created by Yakir on 16/4/25.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

private let margin = 50
class CellActionsView: UIView {
    
    
    var user: User? {
        didSet {
            retweetLabel.text = "\(user!.listed_count ?? 0)"
            favoriteLabel.text = "\(user!.favourites_count ?? 0)"
        }
    }
    // MARK: - 私有控件
    // 回复
    private lazy var replyButton = UIButton(ykImageName: "icn_social_proof_conversation_default", title: nil)
    // 转发
    private lazy var retweetButton = UIButton(type: UIButtonType.Custom)
    private lazy var retweetImage = UIImageView(ylImageName: "icn_activity_rt_tweet")
    private lazy var retweetLabel = UILabel(ykText: "3")
    // 点赞
    private lazy var favoriteButton = UIButton(type: UIButtonType.Custom)
    private lazy var favoriteImage = UIImageView(ylImageName: "icn_tweet_action_inline_favorite")
    private lazy var favoriteLabel = UILabel(ykText: "15")
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupUI()
        buttonAddEvent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 点击事件
extension CellActionsView {

    func buttonAddEvent() {
        retweetButton.addTarget(self, action: #selector(CellActionsView.selectedRetweet), forControlEvents: .TouchUpInside)
        favoriteButton.addTarget(self, action: #selector(CellActionsView.selectedFavorite), forControlEvents: .TouchUpInside)
    }
    
    @objc func selectedRetweet() {
        UIView.animateWithDuration(0.4) {
            let listCount = (self.user?.listed_count ?? 0) + 1
            self.retweetLabel.text = "\(listCount)"
            self.retweetImage.image = UIImage(named: "icn_activity_rt_tweet_Selected")
            self.retweetImage.snp_updateConstraints { (make) in
                make.top.equalTo(self.retweetButton).offset(2)
            }
        }
    }
    @objc func selectedFavorite() {
        UIView.animateWithDuration(0.4) {
            let favoriteCount = (self.user?.favourites_count ?? 0) + 1
            self.favoriteLabel.text = "\(favoriteCount)"
            self.favoriteImage.image = UIImage(named: "icn_tweet_action_inline_favorite_Selected")
            let basicAni = CABasicAnimation.init(keyPath: "transform.scale")
            basicAni.duration = 0.25
            basicAni.toValue = 0.5
            basicAni.fromValue = 1
            self.favoriteImage.layer.addAnimation(basicAni, forKey: "Animation")
        }
    }
}

// MARK: - UI设计
extension CellActionsView {
    func setupUI() {
        
        prepaerButton()
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(favoriteButton)
        
        replyButton.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
        }
        retweetButton .snp_makeConstraints { (make) in
            make.left.equalTo(replyButton.snp_right).offset(margin)
            make.top.equalTo(replyButton)
        }
        favoriteButton.snp_makeConstraints { (make) in
            make.top.equalTo(retweetButton)
            make.left.equalTo(retweetButton.snp_right).offset(margin)
            make.bottom.equalTo(self).offset(12)
        }
        
    }
    
    func prepaerButton() {
        retweetButton.addSubview(retweetImage)
        retweetButton.addSubview(retweetLabel)
        favoriteButton.addSubview(favoriteImage)
        favoriteButton.addSubview(favoriteLabel)

        retweetImage.contentMode = .ScaleAspectFill
        retweetImage.snp_makeConstraints { (make) in
            make.left.equalTo(retweetButton)
            make.top.equalTo(retweetButton).offset(-2)

        }
        retweetLabel.snp_makeConstraints { (make) in
            make.left.equalTo(retweetImage.snp_right).offset(4)
            make.top.equalTo(retweetButton)
        }
        favoriteImage.snp_makeConstraints { (make) in
            make.left.equalTo(favoriteButton)
            make.top.equalTo(favoriteButton)
        }
        favoriteImage.contentMode = .ScaleAspectFill
        favoriteLabel.snp_makeConstraints { (make) in
            make.left.equalTo(favoriteImage.snp_right).offset(4)
            make.top.equalTo(favoriteButton)
        }
        
    }
}