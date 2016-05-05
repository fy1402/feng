//
//  ViewController.swift
//  SimpleProgress
//
//  Created by 丰雨 on 16/5/5.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pushBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushBtn = UIButton(type: UIButtonType.Custom)
        pushBtn?.frame = CGRectMake(150, 50, 50, 50)
        pushBtn?.setTitle("push", forState: UIControlState.Normal)
        pushBtn?.backgroundColor = UIColor.blueColor()
        pushBtn?.titleLabel?.textColor = UIColor.blackColor()
        pushBtn?.addTarget(self, action: #selector(ViewController.pushBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pushBtn!)
    }
    
    func pushBtnClick() {
        self.navigationController?.pushViewController(ProgressBarViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

