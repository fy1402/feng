//
//  ViewController.swift
//  Delegate
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

/// 索引协议
class ViewController: UIViewController, FirstDelegate {

    
    var qzLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstVC = FirstViewController()
//        firstVC.delegate = self
        let rightBtn:UIBarButtonItem = UIBarButtonItem(title:"下一页",style:.Plain,target:self,action:#selector(ViewController.nextPage))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        let rect = CGRect(x:0,y:200,width:320,height:50)
        qzLabel = UILabel(frame:rect)
        qzLabel!.text = "ZzZzZzZz"
        qzLabel!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(qzLabel!)
    }
    
    func nextPage() {
        let svc = FirstViewController()
        /**
         签订协议
         */
        svc.delegate = self
        self.navigationController?.pushViewController(svc, animated: true)
    }
    
    //协议方法实现
    func delegate(title: String) {
        qzLabel!.text = title
        print("qzLabel.text == \(title)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


