//
//  UIImagePickerViewController.swift
//  Core Image
//
//  Created by 丰雨 on 16/6/1.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

 /// 设置代理
protocol UIImagePickerControllerDelegate: NSObjectProtocol {
//    func <#name#>(<#parameters#>) 
}

class UIImagePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
