//
//  SecondViewController.swift
//  Delegate
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func setTitle111(string: String)
}


class SecondViewController: UIViewController {

    var delegate: SecondViewControllerDelegate?
    
    
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
    }

    func btnClicked() {
        if (delegate != nil) {
            delegate?.setTitle111("!!!!!!!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
