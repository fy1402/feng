//
//  SecondViewController.swift
//  NSNotificationCenter_Swift
//
//  Created by 丰雨 on 16/6/8.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        NSNotificationCenter.defaultCenter().postNotificationName("myOberver", object: self, userInfo: ["发送的消息" : "fasongdexiaoxi"])
        Model().postNotification("aa", object: self, userInfo: ["发送的消息" : "fasongdexiaoxi"])
        
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
