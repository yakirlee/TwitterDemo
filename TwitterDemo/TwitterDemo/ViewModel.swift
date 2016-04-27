//
//  ViewModel.swift
//
//
//  Created by Yakir on 16/4/25.
//
//

import UIKit

class ViewModel: NSObject {
    
    var dataList = [User]()
    
    func analysisData(finished: ([User]) -> ()) {
        
        for i in 0...3 {
            let fileName = "twitter_" + "\(i)" + ".json"
            let fileLocation = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
            
            let data = NSData(contentsOfFile: fileLocation!)
            let dict = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
            guard let result = dict["twitter_objects"]!!["users"] else {
                return
            }
            
            let name  = (result as! NSDictionary).keyEnumerator().allObjects as? [String]
            for dictName in name! {
                let dict = (result as! [String:[String: AnyObject]])[dictName]
                dataList.append(User.modelWithDictionary(dict!)!)
            }
        }
    }
    
}
