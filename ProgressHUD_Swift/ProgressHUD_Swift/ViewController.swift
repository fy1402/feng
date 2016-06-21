//
//  ViewController.swift
//  ProgressHUD_Swift
//
//  Created by 丰雨 on 16/6/16.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
        let hud = HProgressViewController()
        
        hud.showControllerProgress(ProgressHUDType.Normal)
        self.presentViewController(hud, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

