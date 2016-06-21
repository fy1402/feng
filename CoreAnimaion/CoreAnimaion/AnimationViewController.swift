//
//  AnimationViewController.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/6/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, AnimationViewDelegate {

    var animationView: AnimationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .setAnimationView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAnimationView() {
        
        let centerY = view.frame.size.height / 2
        let centerX = view.frame.size.width / 2
        
        animationView.delegate = self
        animationView.parentFrame = view.frame
        animationView.frame = CGRectMake(centerX - 50, centerY - 50, 100, 100)
        view.addSubview(animationView)
    }
    
    // MARK: -
    // MARK: AnimationViewDelegate
    func completeAnimation() {
        // 1
        animationView.removeFromSuperview()
        view.backgroundColor = UIColor.colorWithHexString("#40e0b0")
        
        // 2
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 50.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Welcome"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        
        // 3
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,animations: ({
            
            label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
        }), completion: { finished in
            self.addTouchButton()
        })
    }
    
    func addTouchButton() {
        let button = UIButton()
        button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
        button.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func btnClick() {
        view.backgroundColor = UIColor.whiteColor()
        view.subviews.forEach { (
            $0.removeFromSuperview()
            )}
        animationView = AnimationView(frame: CGRectZero)
        setAnimationView()
    }

    

}
