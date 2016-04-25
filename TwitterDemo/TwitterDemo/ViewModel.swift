//
//  ViewModel.swift
//  
//
//  Created by Yakir on 16/4/25.
//
//

import UIKit


class ViewModel: NSObject {

    func analysisData() {
        
        for i in 0...3 {
            let fileName = "twitter_" + "\(i)" + ".json"
            let fileLocation = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
            
            let data = NSData(contentsOfFile: fileLocation!)
            let dict = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSArray
            
        }
        

    }
    
}
