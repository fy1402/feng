//
//  ViewController.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/5/23.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var i: Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn("CABasicAnimation")
        createBtn("划线")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBtn(title: String) -> UIButton {
        i += 1;
        let btn: UIButton?
        btn = UIButton(type: UIButtonType.Custom)
        btn?.frame = CGRectMake(50, CGFloat(i) * (50 + 10), 150, 50)
        btn?.setTitle(title, forState: UIControlState.Normal)
        btn?.setTitleColor(Tool().arcColor(), forState: UIControlState.Normal)
        btn?.tag = i;
        btn?.addTarget(self, action: #selector(ViewController.pushViewController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        
        return btn!
    }
    
    
    func pushViewController(button: UIButton?) {
        if button?.tag == 1 {
            let cabasicVC = CABasicAnimationViewController()
            cabasicVC.title = "CABasicAnimation"
            self.navigationController?.pushViewController(cabasicVC, animated: true)
        }
    }


}

