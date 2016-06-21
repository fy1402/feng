//
//  FirstViewController.swift
//  Delegate
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

/**
 *  设置协议
 */
protocol FirstDelegate: NSObjectProtocol {
    func delegate(title: String)
}

class FirstViewController: UIViewController, SecondViewControllerDelegate {

//    var delegate = FirstDelegate?()
    let name: String = "文摘"
    
    var delegate: FirstDelegate?
    var temp = 0
    
    var qzLabel:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondViewController"
        self.view.backgroundColor = UIColor.greenColor()
        let rect = CGRect(x:50,y:200,width:150,height:50)
        let myButton = UIButton(frame:rect)
        myButton.center = CGPointMake(160,200)
        myButton.setTitle("改变Label内容",forState:.Normal)
        myButton.addTarget(self, action: #selector(FirstViewController.btnClicked), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
        // Do any additional setup after loading the view.
        
        
        let rightBtn:UIBarButtonItem = UIBarButtonItem(title:"下一页",style:.Plain,target:self,action:#selector(ViewController.nextPage))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        let rect1 = CGRect(x:0,y:300,width:320,height:50)
        qzLabel = UILabel(frame:rect1)
        qzLabel!.text = "CCCCCCC"
        qzLabel!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(qzLabel!)
    }
    
    func nextPage() {
        let secVC = SecondViewController()
        secVC.delegate = self
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    func setTitle111(string: String) {
        qzLabel!.text = string
    }
    
    func btnClicked() {
        print("点击")
        temp += 1
        
        /**
         *  协议实现方法
         */
        if (delegate != nil) {
            delegate?.delegate("hhhh--delegate")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
