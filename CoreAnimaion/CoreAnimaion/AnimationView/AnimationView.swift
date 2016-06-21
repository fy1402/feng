//
//  AnimationView.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/6/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

protocol AnimationViewDelegate: class {
    func completeAnimation()
}

class AnimationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        self.alpha = 0.7
        addCirclelayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     *  circleLayer, triangleLayer
     */
    
    let circleLayer: CAShapeLayer = CAShapeLayer()  //圆部分
    let triangleLayer: CAShapeLayer = CAShapeLayer()  // 三角形
    let redRectangleLayer: CAShapeLayer = CAShapeLayer() // 红矩形
    let blueRectangleLayer: CAShapeLayer = CAShapeLayer()    //蓝矩形
    let waveLayer: CAShapeLayer = CAShapeLayer()    //波动
    
    var parentFrame: CGRect = CGRectZero
    
    weak var delegate: AnimationViewDelegate?
    
    func addCirclelayer() {
        circleLayer.fillColor = UIColor.colorWithHexString("#da70d6").CGColor
        circleLayer.path = circleSmallPath.CGPath
        
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.CGPath
        expandAnimation.toValue = circleBigPath.CGPath
        expandAnimation.duration = 0.3
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        circleLayer.addAnimation(expandAnimation, forKey: nil)
        
        
        /**
         add circle layer
         */
        self.layer.addSublayer(circleLayer)
        
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(AnimationView.wobbleCircleLayer), userInfo: nil, repeats: false)
    }
    
    /**
     circle layer wobble animation
     */
    func wobbleCircleLayer() {
        circleLayer.addAnimation(wobbleAnimate(), forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(AnimationView.showTriangleAnimation), userInfo: nil, repeats: false)
    }
    
    /**
     wobbl group animation
     */
    func wobbleAnimate() -> CAAnimationGroup {
        // 1、animation begin from bigPath to verticalPath
        let animation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation1.fromValue = circleBigPath.CGPath
        animation1.toValue = circleVerticalSquishPath.CGPath
        animation1.beginTime = 0
        animation1.duration = 0.3
        
        // 2、animation vertical to horizontal
        let  animation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation2.fromValue = circleVerticalSquishPath.CGPath
        animation2.toValue = circleHorizontalSquishPath.CGPath
        animation2.beginTime = animation1.beginTime + animation1.duration
        animation2.duration = 0.3
        
        // 3、animation horizontal to vertical
        let  animation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation3.fromValue = circleHorizontalSquishPath.CGPath
        animation3.toValue = circleVerticalSquishPath.CGPath
        animation3.beginTime = animation2.beginTime + animation2.duration
        animation3.duration = 0.3
        
        // 4、animation vertical to bigPath
        let  animation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation4.fromValue = circleVerticalSquishPath.CGPath
        animation4.toValue = circleBigPath.CGPath
        animation4.beginTime = animation3.beginTime + animation3.duration
        animation4.duration = 0.3
        
        // 5、group animation
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animation1, animation2, animation3, animation4]
        animationGroup.duration = 4 * 0.3
        animationGroup.repeatCount = 3
        //  addAnimation(animationGroup, forKey: nil)
        return animationGroup
    }
//    52.225.175
    /// begin path
    var circleSmallPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    /// end path
    var circleBigPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.0, y: 17.5, width: 95.0, height: 95.0))
    }
    /// the path squish circle on vertical
    var circleVerticalSquishPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    /// the path squish circle on horizontal
    var circleHorizontalSquishPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    
    //缩
    func contract() -> CABasicAnimation{
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = circleBigPath.CGPath
        contractAnimation.toValue = circleSmallPath.CGPath
        contractAnimation.duration = 0.3
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.removedOnCompletion = false
//        addAnimation(contractAnimation, forKey: nil)
        return contractAnimation
    }
    
    /**
     show triangle animation
     */
    func showTriangleAnimation() {
        triangleLayer.fillColor = UIColor.colorWithHexString("#da70d6").CGColor
        triangleLayer.strokeColor = UIColor.colorWithHexString("#da70d6").CGColor
        triangleLayer.lineWidth = 7.0
        triangleLayer.lineCap = kCALineCapRound
        triangleLayer.lineJoin = kCALineJoinRound
        triangleLayer.path = smallTrianglePath.CGPath
        
        self.layer.addSublayer(triangleLayer)
        
        triangleLayer.addAnimation(triangleAnimate(), forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(AnimationView.transformAnimation), userInfo: nil, repeats: false)
    }
    
    /**
     triangle animate function
     */
    func triangleAnimate() ->CAAnimationGroup {
        //left
        let triangleAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationLeft.fromValue = smallTrianglePath.CGPath
        triangleAnimationLeft.toValue = leftTrianglePath.CGPath
        triangleAnimationLeft.beginTime = 0.0
        triangleAnimationLeft.duration = 0.3
        
        // right
        let triangleAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationRight.fromValue = leftTrianglePath.CGPath
        triangleAnimationRight.toValue = rightTrianglePath.CGPath
        triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration
        triangleAnimationRight.duration = 0.25
        // top
        let triangleAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationTop.fromValue = rightTrianglePath.CGPath
        triangleAnimationTop.toValue = topTrianglePath.CGPath
        triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration
        triangleAnimationTop.duration = 0.2
        // group
        let triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        triangleAnimationGroup.animations = [triangleAnimationLeft, triangleAnimationRight, triangleAnimationTop]
        triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.removedOnCompletion = false
        
        return triangleAnimationGroup
    }
    
    var smallTrianglePath: UIBezierPath {
        let smallPath = UIBezierPath()
        smallPath.moveToPoint(CGPointMake(5.0 + 30.0, 95.0))
        smallPath.addLineToPoint(CGPointMake(50.0, 12.5 + 30.0))
        smallPath.addLineToPoint(CGPointMake(95.0 - 30.0, 95.0))
        smallPath.closePath()
        return smallPath
    }
    var leftTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + 30.0))
        trianglePath.addLineToPoint(CGPoint(x: 95.0 - 30.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var rightTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + 30.0))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var topTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }

    /**
     self transform and add rectangle
     */
    func transformAnimation() {
        transformRotationZ()
        circleLayer.addAnimation(contract(), forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.45, target: self, selector: #selector(drawRedRectangleAnimation), userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(0.65, target: self, selector: #selector(drawBlueRectangleAnimation), userInfo: nil, repeats: false)
    }
    
    /**
     self transform z
     */
    func transformRotationZ() {
        self.layer.anchorPoint = CGPointMake(0.5, 0.65)
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.removedOnCompletion = true
        layer.addAnimation(rotationAnimation, forKey: nil)
    }
    
    /**
     draw red stroke
     */
    func drawRedRectangleAnimation(){
        redRectangleLayer.lineWidth = 5
        redRectangleLayer.fillColor = UIColor.clearColor().CGColor
        redRectangleLayer.path = rectangleFullPath.CGPath
        redRectangleLayer.addAnimation(strokeChangeWithColor(UIColor.redColor()), forKey: nil)
        self.layer.addSublayer(redRectangleLayer)
    }
    
    // 线路径
    var rectangleFullPath: UIBezierPath {
        let rectanglePath = UIBezierPath()
        rectanglePath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        rectanglePath.addLineToPoint(CGPoint(x: 0.0, y: -rectanglePath.lineWidth))
        rectanglePath.addLineToPoint(CGPoint(x: 100.0, y: -rectanglePath.lineWidth))
        rectanglePath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        rectanglePath.addLineToPoint(CGPoint(x: -rectanglePath.lineWidth / 2, y: 100.0))
        rectanglePath.closePath()
        return rectanglePath
    }
    
    func strokeChangeWithColor(color: UIColor) -> CABasicAnimation {
        redRectangleLayer.strokeColor = color.CGColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        return strokeAnimation
    }
    /**
     draw blue stroke
     */
    func drawBlueRectangleAnimation() {
        self.layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.addAnimation(strokeChangeWithColor(UIColor.blueColor()), forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(drawWaveAnimation), userInfo: nil, repeats: false)
    }
    
    //wave 波动
    func drawWaveAnimation() {
        layer.addSublayer(waveLayer)
        waveLayer.fillColor = UIColor.cyanColor().CGColor
        waveLayer.path = wavePathStarting.CGPath
        waveLayer.addAnimation(animate(), forKey: nil)
        
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(expandView), userInfo: nil, repeats: false)
    }
    
    var wavePathPre: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var wavePathStarting: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 80.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 80.0), controlPoint1: CGPoint(x: 30.0, y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var wavePathLow: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 60.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var wavePathMid: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var wavePathHigh: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 20.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var wavePathComplete: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func animate() -> CAAnimationGroup {
        /// 1
        let waveAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationPre.fromValue = wavePathPre.CGPath
        waveAnimationPre.toValue = wavePathStarting.CGPath
        waveAnimationPre.beginTime = 0.0
        waveAnimationPre.duration = 0.18
        /// 2
        let waveAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationLow.fromValue = wavePathStarting.CGPath
        waveAnimationLow.toValue = wavePathLow.CGPath
        waveAnimationLow.beginTime = waveAnimationPre.beginTime + waveAnimationPre.duration
        waveAnimationLow.duration = 0.18
        /// 3
        let waveAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationMid.fromValue = wavePathLow.CGPath
        waveAnimationMid.toValue = wavePathMid.CGPath
        waveAnimationMid.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration
        waveAnimationMid.duration = 0.18
        /// 4
        let waveAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationHigh.fromValue = wavePathMid.CGPath
        waveAnimationHigh.toValue = wavePathHigh.CGPath
        waveAnimationHigh.beginTime = waveAnimationMid.beginTime + waveAnimationMid.duration
        waveAnimationHigh.duration = 0.18
        /// 5
        let waveAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationComplete.fromValue = wavePathHigh.CGPath
        waveAnimationComplete.toValue = wavePathComplete.CGPath
        waveAnimationComplete.beginTime = waveAnimationHigh.beginTime + waveAnimationHigh.duration
        waveAnimationComplete.duration = 0.18
        /// group animation
        let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [waveAnimationPre, waveAnimationLow, waveAnimationMid, waveAnimationHigh, waveAnimationComplete]
        arcAnimationGroup.duration = waveAnimationComplete.beginTime + waveAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.removedOnCompletion = false
        
        return arcAnimationGroup
    }
    
    func expandView() {
        backgroundColor = UIColor.colorWithHexString("#40e0b0")
        frame = CGRectMake(frame.origin.x - blueRectangleLayer.lineWidth,
                           frame.origin.y - blueRectangleLayer.lineWidth,
                           frame.size.width + blueRectangleLayer.lineWidth * 2,
                           frame.size.height + blueRectangleLayer.lineWidth * 2)
        layer.sublayers = nil
        
        UIView.animateWithDuration(3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.frame = self.parentFrame
            }, completion: { finished in
                self.delegate?.completeAnimation()
        })

    }
}
