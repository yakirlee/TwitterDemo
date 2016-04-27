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
    
    var user: User? {
        didSet {
            statusView.user = user
            actionView.user = user
        }
    }
    // MARK: - 私有控件
    private lazy var statusView = CellStatusView(frame: CGRectZero)
    private lazy var actionView = CellActionsView(frame: CGRectZero)
    
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
        
        contentView.addSubview(statusView)
        contentView.addSubview(actionView)
        
        statusView.snp_makeConstraints { (make) in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(contentView)
        }
        actionView.snp_makeConstraints { (make) in
            make.left.equalTo(statusView).offset(8 * margin)
            make.top.equalTo(statusView.snp_bottom).offset(margin)
            make.right.equalTo(statusView)
            make.bottom.equalTo(contentView)
        }
        actionView.userInteractionEnabled = true
        
        // 性能调优 关键  异步绘制栅格化
        layer.drawsAsynchronously = true
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    
}
