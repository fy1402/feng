//
//  Json.swift
//  APP->Settings
//
//  Created by 丰雨 on 16/6/13.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class Json {
    var icon: UIImage?
    var title: NSString = ""
    var url: NSURL!
    
    static func listItemFromJSONData(jsonData: NSData?) -> NSArray {
        let itemsDescriptors: NSArray = try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: []) as! NSArray
        let items: NSMutableArray = NSMutableArray()
        
        for itemDesc in itemsDescriptors {
            let item = Json()
            item.icon = UIImage(named: itemDesc["icon"] as! String)
            item.title = itemDesc["title"] as! String
            item.url = NSURL(string: itemDesc["url"] as! String)!
            items.addObject(items)
        }
        return items.copy() as! NSArray
    }
    
}


class JSON {
    var icon: UIImage?
    var title: NSString = ""
    var url: NSURL!
    
    static func listItemFromJSONData(jsonData: NSData?) -> NSArray {
        if let nonNilJsonData = jsonData {
            if let jsonItems: NSArray = (try? NSJSONSerialization.JSONObjectWithData(nonNilJsonData, options: [])) as? NSArray {
                let items = NSMutableArray()
                for itemDesc in jsonItems {
                    let item = JSON()
                    if let icon = itemDesc["icon"] as? String {
                        item.icon = UIImage(named: icon)
                    }
                    if let title = itemDesc["title"] as? String {
                        item.title = title
                    }
                    if let urlString = itemDesc["url"] as? String {
                        if let url = NSURL(string: urlString) {
                            item.url = url
                        }
                    }
                    items.addObject(item)
                }
                return items.copy() as! NSArray
            }
        }
        return []
    }
}

class _JSON {
    var icon: UIImage?
    var title: NSString = ""
    var url: NSURL!
    
    static func listItemFromJSONData(jsonData: NSData?) -> NSArray {
        guard let nonNilJsonData = jsonData,
        let json = try? NSJSONSerialization.JSONObjectWithData(nonNilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                return []
        }
        
        var items = [_JSON]()
        for itemDesc in jsonItems {
            let item = _JSON()
            if let icon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: icon)
            }
            if let title = itemDesc["title"] as? String {
                item.title = title;
            }
            if let urlString = itemDesc["url"] as? String, let url = NSURL(string: urlString) {
                item.url = url
            }
            items.append(item)
        }
        return items
    }
    
}
