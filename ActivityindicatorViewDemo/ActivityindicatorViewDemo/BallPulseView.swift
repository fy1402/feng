//
//  BallPulseView.swift
//  ActivityindicatorViewDemo
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class BallPulseView: UIView {
    
//    private static let DEFAULT_TYPE: NVActivityIndicatorType = .Pacman
    private static let DEFAULT_COLOR = UIColor.whiteColor()
    private static let DEFAULT_PADDING: CGFloat = 0
    
    /// Color of activity indicator view.
    @IBInspectable internal var color: UIColor = BallPulseView.DEFAULT_COLOR
    
    /// Padding of activity indicator view.
    @IBInspectable internal var padding: CGFloat = BallPulseView.DEFAULT_PADDING
    
    /// Current status of animation, this is not used to start or stop animation.
    internal var animating: Bool = false
    
    /// Specify whether activity indicator view should hide once stopped.
    @IBInspectable internal var hidesWhenStopped: Bool = true
    
    internal init(frame: CGRect, color: UIColor = DEFAULT_COLOR, padding: CGFloat = DEFAULT_PADDING) {
        self.color = color
        self.padding = padding
        super.init(frame: frame)
    }
    
    /**
     Start animation.
     */
    internal func startAnimation() {
        if hidesWhenStopped && hidden {
            hidden = false
        }
        if (self.layer.sublayers == nil) {
            setUpAnimation()
        }
        self.layer.speed = 1
        self.animating = true
    }
    
    /**
     Stop animation.
     */
    internal func stopAnimation() {
        self.layer.sublayers = nil
        self.animating = false
        if hidesWhenStopped && !hidden {
            hidden = true
        }
    }
    
    // MARK: Privates
    
    private func setUpAnimation() {
//        let animation = self.animation()
        
        self.layer.sublayers = nil
        
        let paddedRect = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(padding, padding, padding, padding))
        setUpAnimationInLayer(self.layer, size: paddedRect.size, color: self.color)
    }
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
//        func BallPulse(layer: CALayer, size: CGSize, color: UIColor) {
            let circleSpacing: CGFloat = 2
            let circleSize: CGFloat = (size.width - 2 * circleSpacing) / 3
            let x: CGFloat = (layer.bounds.size.width - size.width) / 2
            let y: CGFloat = (layer.bounds.size.height - circleSize) / 2
            let duration: CFTimeInterval = 0.75
            let beginTime = CACurrentMediaTime()
            let beginTimes: [CFTimeInterval] = [0.12, 0.24, 0.36]
            let timingFunction  = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
            let animation = CAKeyframeAnimation(keyPath: "transform.scale")
            
            //animation
            animation.keyTimes = [0, 0.3, 1]
            animation.timingFunctions = [timingFunction, timingFunction]
            animation.values = [1, 0.3, 1]
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.removedOnCompletion = false
            
            /**
             draw circles
             */
            for i in 0 ..< 3 {
                let circle = createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
                let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i), y: y, width: circleSize, height: circleSize)
                
                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.addAnimation(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
//        }
        
    }
    
    func createLayerWith(size size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        //        let lineWidth: CGFloat = 2
        
        path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        layer.fillColor = color.CGColor
        layer.backgroundColor = nil
        layer.path = path.CGPath
        return layer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
