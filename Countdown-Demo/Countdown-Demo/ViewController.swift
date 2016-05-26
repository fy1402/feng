//
//  ViewController.swift
//  Countdown-Demo
//
//  Created by 丰雨 on 16/5/26.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        let frame = CGRectMake(0, 100, self.view.frame.size.width, 100)
        let countView = CountdownView(frame: frame)
//        countView.backgroundColor = UIColor.redColor()
//        countView.frame = CGRectMake(0, 50, self.view.frame.size.width, 100)
        self.view.addSubview(countView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

