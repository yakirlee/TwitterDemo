//
//  Model.swift
//
//
//  Created by 李 on 16/4/24.
//
//

import UIKit
import YYKit



class Model: NSObject {
    
    var uid: [String:AnyObject]?
    var user: User?
}

class User: NSObject {
    
    var name: String?
    var screen_name: String?
    var url: String?
    var location: String?
    var created_at: String?
    var id_str: String?
    var profile_image_url: String?
    var desc: String?
    
    var profile_text_color: String?
    var profile_background_color: String?
    var profile_background_image_url: String?
    // 配图
    var profile_banner_url: String?
    
    var listed_count: UInt32 = 0
    var statuses_count: UInt32 = 0
    var favourites_count: UInt32 = 0
    var friends_count: UInt32 = 0
    
   
    
    override var description: String {
        let key = ["name", "screen_name", "url", "location", "created_at", "id_str", "profile_image_url","desc",
                   "profile_text_color","listed_count","profile_background_color","profile_background_image_url","profile_banner_url",
                   "statuses_count", "favourites_count", "friends_count"]
        return dictionaryWithValuesForKeys(key).description
    }
}

extension User: YYModel {

    static func modelCustomPropertyMapper() -> [String : AnyObject]? {
         return["desc":"description"]
    }
}
