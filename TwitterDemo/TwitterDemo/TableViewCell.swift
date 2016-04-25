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

    // MARK: - 私有控件
    private lazy var statusView = CellStatusView(frame: CGRectZero)
    private lazy var actionView = CellActionsView(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
        actionView.userInteractionEnabled = true
        
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
            make.height.equalTo(44)
            make.bottom.equalTo(contentView)
        }
    
    }
    
    
}
