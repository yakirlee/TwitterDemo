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
    
    private lazy var nameLabel = UILabel(ykText: "呵呵哒")
    
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
        contentView.addSubview(nameLabel)
        
        contentView.snp_makeConstraints { (make) in
            make.height.equalTo(100)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(margin)
            make.top.equalTo(margin)
        }
        nameLabel.sizeToFit()
    }
}
