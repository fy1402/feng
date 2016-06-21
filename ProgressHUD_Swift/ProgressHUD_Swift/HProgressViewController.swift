//
//  HProgressViewController.swift
//  ProgressHUD_Swift
//
//  Created by 丰雨 on 16/6/16.
//  Copyright © 2016年 Feng. All rights reserved.
//  毛玻璃&半透明HUD

import UIKit



class HProgressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createNormalView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - 全景的虚化
    
    internal func showControllerProgress(type: ProgressHUDType) {
        switch type {
        case .Blur:
            print("》毛玻璃效果")
        default:
            print("普通效果")
            createNormalView()
            break
        }
    }
    
    private func createBlurView () {
        
    }
    
    private func createNormalView() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.alpha = 0.3
        super.presentedViewController?.addChildViewController(self)
    }
    
    //MARK: - 消失
    internal func dismiss() {
        /**
         *  添加动画
         */
        super.removeFromParentViewController()
    }
    
    

}

//MARK: - ProgressHUDType
enum ProgressHUDType {
    case Blur
    case Normal
}

