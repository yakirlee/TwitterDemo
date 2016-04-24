//
//  ViewController.swift
//  TwitterDemo
//
//  Created by 李 on 16/4/24.
//  Copyright © 2016年 李. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - 私有控件
    private lazy var tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        return cell
    }
}


extension ViewController {
    func setupUI() {
        navigationItem.title = "Twitter"
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

