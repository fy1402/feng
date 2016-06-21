//
//  Myoberver.swift
//  NSNotificationCenter_Swift
//
//  Created by 丰雨 on 16/6/8.
//  Copyright © 2016年 Feng. All rights reserved.
//  我的观察器

import UIKit

class Myoberver: NSObject {

    var name: String = ""
    
    init(name: String) {
        super.init()
        
        self.name = name
        
        //接收通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Myoberver.downloadImage(_:)), name: "DownloadImageNotification", object: nil)
    }
    
    func downloadImage(notification: NSNotification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let value1 = userInfo["value1"] as! String
        let value2 = userInfo["value2"] as! Int
        
        print("\(name) 获取到通知，用户数据是［\(value1),\(value2)］")
        
        sleep(3)
        
        print("\(name)执行完毕")
        
        
    }
    
    deinit {
        //记得移除通知监听
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
