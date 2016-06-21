//
//  CircleLayer.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/6/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {

    let kAnimationDuration: CFTimeInterval = 0.3
    let kAnimationBeginTime: CFTimeInterval = 0.0
    
    override init() {
        super.init()
        self.fillColor = UIColor.colorWithHexString("#da70d6").CGColor
        self.path = circleSmallPath.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

        /// begin path
    var circleSmallPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    
        /// end path
    var circleBigPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
        /// the path squish circle on vertical
    var circleVerticalSquishPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 2.5, width: 95.0, height: 95.0))
    }
    
        /// the path squish circle on horizontal
    var circleHorizontalSquishPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 5.0, y: 5.0, width: 90.0, height: 90.0))
    }
    
    /**
     expand animation function
     */
    func wobbleAnimate() {
        //1. animation begin from bigPath to verticalPath
        let animation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation1.fromValue = circleBigPath.CGPath
        animation1.toValue = circleVerticalSquishPath.CGPath
        animation1.beginTime = kAnimationBeginTime
        animation1.duration = kAnimationDuration
        
        //2. animation vertical to horizontal
        let animation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation2.fromValue = circleVerticalSquishPath.CGPath
        animation2.toValue  = circleHorizontalSquishPath.CGPath
        animation2.beginTime = animation1.beginTime + animation2.duration
        animation2.duration = kAnimationDuration
        
        //3. animation horizontal to vertical
        let  animation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation3.fromValue = circleHorizontalSquishPath.CGPath
        animation3.toValue = circleVerticalSquishPath.CGPath
        animation3.beginTime = animation2.beginTime + animation2.duration
        animation3.duration = kAnimationDuration
        
        // 4、animation vertical to bigPath
        let  animation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation4.fromValue = circleVerticalSquishPath.CGPath
        animation4.toValue = circleBigPath.CGPath
        animation4.beginTime = animation3.beginTime + animation3.duration
        animation4.duration = kAnimationDuration
        
        // 5、group animation
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animation1, animation2, animation3, animation4]
        animationGroup.duration = 4 * kAnimationDuration
        animationGroup.repeatCount = 2
        addAnimation(animationGroup, forKey: nil)
    }
    
    /**
     expand animation function
     */
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.CGPath
        expandAnimation.toValue = circleBigPath.CGPath
        expandAnimation.duration = kAnimationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        self.addAnimation(expandAnimation, forKey: nil)
    }
    
    /**
     contract animation function
     */
    func contract() {
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = circleBigPath.CGPath
        contractAnimation.toValue = circleSmallPath.CGPath
        contractAnimation.duration = kAnimationDuration
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.removedOnCompletion = false
        addAnimation(contractAnimation, forKey: nil)
    }
    
    
}
