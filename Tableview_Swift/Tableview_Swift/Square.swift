//
//  Square.swift
//  Tableview_Swift
//
//  Created by 丰雨 on 16/6/3.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class Square: NSObject {
    
    var h: CGFloat = 0
    var w: CGFloat = 0
    
    init(dic: [String: NSNumber]?) {
        super.init()
        guard dic?.count > 0 else {
            return
        }
        
        setValuesForKeysWithDictionary(dic!)
    }
    
    class func squares() -> [Square] {
        let path = NSBundle.mainBundle().pathForResource("1.plist", ofType: nil)!
        
        let array = NSArray(contentsOfFile: path)!
        var arrayM = [Square]()
        
        for item in array {
            let dic = item as! [String: NSNumber]
            arrayM.append(Square(dic: dic))
        }
        
        return arrayM
    }
    
}
