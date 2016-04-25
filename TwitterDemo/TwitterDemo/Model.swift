//
//  Model.swift
//  
//
//  Created by 李 on 16/4/24.
//
//

import UIKit

class Model: NSObject {

//    @interface T1APIRespose : NSObject
//    @property (nonatomic, strong) NSDictionary *moments; ///< empty
//    @property (nonatomic, strong) NSDictionary<NSString *, T1User *> *users; ///< <UID(NSString), T1User>
//    @property (nonatomic, strong) NSDictionary<NSString *, T1Tweet *> *tweets; ///< <TID(NSString), T1Tweet>
//    @property (nonatomic, strong) NSArray *timelineItmes; ///< Array<T1Tweet/T1Conversation>
//    @property (nonatomic, strong) NSArray *timeline; ///< Array<Dictionary>
//    
//    @property (nonatomic, strong) NSString *cursorTop;
//    @property (nonatomic, strong) NSString *cursorBottom;
//    @property (nonatomic, strong) NSArray *cursorGaps;
//    @end
    
}

class APIRespose: NSObject {
    
    var moments: String?
//    var users: [String: AnyObject]?
//    var tweets: [String: AnyObject]?
//    var timelineItems: [AnyObject]?
//    var tiemline: [[String: AnyObject]]?
    var cursorTop: String?
    var cursorBottom: String?
//    var cursorGap: [AnyObject]?
    
}