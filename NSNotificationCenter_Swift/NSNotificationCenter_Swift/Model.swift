//
//  Model.swift
//  NSNotificationCenter_Swift
//
//  Created by 丰雨 on 16/6/8.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

protocol NotificationDelegate {
    func addObserverDelegate(noti: AnyObject?)
}

class Model: NSObject {
    
    
    var delegate: NotificationDelegate?
    
    // MARK: - Instance Methods
    
    // Post
    func postNotification(name: String, object: AnyObject?, userInfo: [NSObject: AnyObject]?) {
        NSNotificationCenter.defaultCenter().postNotificationName(name, object: object, userInfo: userInfo)
    }
    
    // MARK: - Instance Methods
    
    // Add
    func addNotification(name: String, object: AnyObject? = nil) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Model.add(_:)), name: name, object: object)
    }
    
    @objc private func add(noti: NSNotification) {
        let userInfo = noti.userInfo as! [String: AnyObject]
        if delegate != nil {
            delegate?.addObserverDelegate(userInfo)
        }
    }
    
    // MARK: - Instance Methods
    
    // Removie
    func removeNotification(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(name)
    }
}
