//
//  ViewController.swift
//  NSNotificationCenter_Swift
//
//  Created by 丰雨 on 16/6/8.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NotificationDelegate {

    let observer = Myoberver(name: "观察器1")
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .ContactAdd)
        button.frame = CGRectMake(50, 50, 100, 100)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: #selector(ViewController.add), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
//        /**
//         发送通知 （系统类通知）
//         */NSNotificationCenter.defaultCenter().postNotificationName("nsnotificationcenter", object: "🐶")
//        
//        let notocationCenter = NSNotificationCenter.defaultCenter()
//        let operationQueue = NSOperationQueue.mainQueue()
//        
//        let applicationDidEnterbackgroundObserver = notocationCenter.addObserverForName(UIApplicationDidEnterBackgroundNotification, object: nil, queue: operationQueue) { (notofication: NSNotification!) in
//            print("系统进入后台")
//        }
//        
//        
//         //如果不需要的话，记得把相应的通知注册给取消，避免内存浪费或奔溃
//        notocationCenter.removeObserver(applicationDidEnterbackgroundObserver)
        
        
        //自定义通知
        print("发送通知")
    NSNotificationCenter.defaultCenter().postNotificationName("DownloadImageNotification", object: self, userInfo: ["value1": "hangge.com", "value2" : 12345])
        NSNotificationCenter.defaultCenter().removeObserver(self)
        print("通知完毕")
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.printf(_:)), name: "myOberver", object: nil)
        Model().addNotification("aa")
    }
    
    func printf(notification: NSNotification) {
        let userInfo = notification.userInfo as! [String : AnyObject]
        let message = userInfo["发送的消息"] as! String
        print("收到的消息\(message)")
    }
    
    func addObserverDelegate(noti: AnyObject?) {
        print("aaa")
    }
    
    
    func add() {
        
        //        发送通知
        NSNotificationCenter.defaultCenter().postNotificationName("myOberver", object: self, userInfo: ["发送的消息" : "fasongdexiaoxi"])

        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







