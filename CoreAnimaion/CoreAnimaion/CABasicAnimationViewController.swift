//
//  CABasicAnimationViewController.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/5/23.
//  Copyright © 2016年 Feng. All rights reserved.
//  参考http://objccn.io/issue-12-1/

import UIKit

class CABasicAnimationViewController: UIViewController {

    var i: Int = 0
    var j: Int = 0
    
//    var view1: UIImageView?
//    var view2: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setCABasicAnimation(setView())   //方大缩小
        circularMotion(setView1())       //绕圆旋转
//        setBasicAnimation(setView())
//        moveViewCABasicAnimation(setView())
//        pathCABasicAnimation(setView())
//        byValueBasicAnimation(setView(), view2: setView())
//        timeFun(setView())
    }
    
    func setView() -> UIImageView{
        let view: UIImageView = UIImageView(frame: CGRectMake(200, 200 , 20, 20))
        view.backgroundColor = Tool().arcColor()
        Tool().roundOut(view)
        self.view.addSubview(view)
        return view
    }
    
    func setView1() -> UIImageView{
        let view: UIImageView = UIImageView(frame: CGRectMake(205, 205, 10, 10))
        view.backgroundColor = Tool().arcColor()
        Tool().roundOut(view)
        self.view.addSubview(view)
        return view
    }
    
    func setView2() -> UIImageView{
        let view: UIImageView = UIImageView(frame: CGRectMake(100, 100 * CGFloat(j) + 100 , 50, 50))
        view.backgroundColor = Tool().arcColor()
        self.view.addSubview(view)
        return view
    }
    
    func createBtn(title: String) -> UIButton {
        let btn: UIButton?
        var k: CGFloat = 0
        if CGFloat(i) * (50 + 10) > 350 {
            k = 60
            i = 0
        }
        
        btn = UIButton(type: UIButtonType.Custom)
        btn?.frame = CGRectMake(CGFloat(i) * (50 + 10), k, 50, 50)
        btn?.setTitle(title, forState: UIControlState.Normal)
        btn?.setTitleColor(Tool().arcColor(), forState: UIControlState.Normal)
        btn?.tag = i;
        btn?.addTarget(self, action: #selector(CABasicAnimationViewController.setAnimation(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        i += 1
        
        return btn!
    }
    
    //CALayer放大缩小
    func setCABasicAnimation(view: UIImageView?)  {
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform.scale"
        animation.repeatCount = HUGE
        animation.autoreverses = true
        animation.fromValue = NSNumber.init(float: 1)
        animation.toValue = NSNumber.init(float: 2.2)
        animation.duration = 1
        view!.layer.addAnimation(animation, forKey: "transform.scale")
    }
    
    //CALayer 移动
    func moveViewCABasicAnimation(view: UIImageView?) {
        let animation = CABasicAnimation.init(keyPath: "transform.translation")
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 50))
        animation.removedOnCompletion = false
        animation.repeatCount = 100
        animation.fillMode = kCAFillModeForwards
        view!.layer.addAnimation(animation, forKey: "transform.translation")
    }
    
    //CALayer 路径动画 帧动画
    func pathCABasicAnimation(view: UIImageView?) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, view!.center.x, view!.center.y)
        //添加4⃣️曲线
        /*绘制二次贝塞尔曲线
         c:图形上下文
         cpx:控制点x坐标
         cpy:控制点y坐标
         x:结束点x坐标
         y:结束点y坐标
         */
//        CGPathAddQuadCurveToPoint(path, nil, 312, 184, 312, 384);
//        CGPathAddQuadCurveToPoint(path, nil, 310, 584, 512, 584);
//        CGPathAddQuadCurveToPoint(path, nil, 712, 584, 712, 384);
//        CGPathAddQuadCurveToPoint(path, nil, 712, 184, 512, 184);
        
        //内塞尔曲线
        //添加曲线
        /*绘制三次贝塞尔曲线
         c:图形上下文
         cp1x:第一个控制点x坐标
         cp1y:第一个控制点y坐标
         cp2x:第二个控制点x坐标
         cp2y:第二个控制点y坐标
         x:结束点x坐标
         y:结束点y坐标
         */
        CGPathAddCurveToPoint(path, nil, 100, 10, 200, 200, 320, 600)
//        CGPathAddCurveToPoint(path, nil, 200, 300, 300, 400, 200, 300)
        animation.path = path
        animation.duration = 10
        animation.repeatCount = 100
        view!.layer.addAnimation(animation, forKey: "position")
        //    [keyyanimation setPath:path];
        //    [keyyanimation setDuration:1];//时间
        //    [keyyanimation setRepeatCount:3];//次数
        //    [view.layer addAnimation:keyyanimation forKey:@"key"];
        view?.layer.position = CGPointMake(320, 600)    //移动到终点的位置
    }
    
    //byValue
    func byValueBasicAnimation(view: UIImageView, view2: UIImageView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.byValue = "378"
        animation.duration = 150
        animation.repeatCount = 100
        view.layer.addAnimation(animation, forKey: "position")
        view.layer.position = CGPointMake(255, 61)
        
        animation.beginTime = CACurrentMediaTime() + 1.5
        
        view2.layer.addAnimation(animation, forKey: "position")
        view2.layer.position = CGPointMake(255, 111)
    }
    
    //多步骤动画
    func moreAnimation(view: UIImageView) {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 10, -10, 0]
        animation.keyTimes = [0, 1/6.0, 3/6.0, 5/6.0, 1]
        animation.duration = 0.4
        animation.additive = true
        view.layer.addAnimation(animation, forKey: "position.x")
    }
    
//    圆周运动
    func circularMotion(view: UIImageView) {
        let boundingRect = CGRectMake(-50, -50, 100, 100);
        //前两个参数控制中心点偏移位置（偏移点受圆周大小控制  一半）  ---->  个人理解
        //后两个参数控制圆周运动的大小
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = CGPathCreateWithEllipseInRect(boundingRect, nil)
        animation.duration = 1
        animation.additive = true
        animation.repeatCount = HUGE
        animation.calculationMode = kCAAnimationPaced  //无视所有已设置的keyTime
        animation.rotationMode = kCAAnimationRotateAuto  //确保旋转
        
        view.layer.addAnimation(animation, forKey: "orbit")
    }
    
    //时间函数
    func timeFun(view: UIImageView) {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 25;
        animation.toValue = 250
        animation.duration = 1
        animation.repeatCount = 100
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.9, 0.7)
//        CAMediaTimingFunction(controlPoints: <#T##Float#>, <#T##c1y: Float##Float#>, <#T##c2x: Float##Float#>, <#T##c2y: Float##Float#>)
//        kCAMediaTimingFunctionLinear 匀速
//        kCAMediaTimingFunctionEaseIn 渐加速
//        kCAMediaTimingFunctionEaseOut 缓解
//        kCAMediaTimingFunctionEaseInEaseOut 缓慢缓解了
//        kCAMediaTimingFunctionDefault  默认
        view.layer.addAnimation(animation, forKey: "basic")
        view.layer.position = CGPointMake(250, 125)
    }
    
    //最基础的动画效果
    func setBasicAnimation(view: UIImageView?) {
            UIView.animateWithDuration(1, animations:{
                () -> Void in
                view!.frame = CGRectMake(200, 200, 50, 50)
            })
    }
    
    
    func setAnimation(button: UIButton?) {
        //最基础的动画效果
        if button?.tag == 0 {
            setBasicAnimation(setView())
        } else if button?.tag == 1 {
            setCABasicAnimation(setView())
        } else if button?.tag == 2 {
            moveViewCABasicAnimation(setView())
        } else if button?.tag == 3 {
            pathCABasicAnimation(setView())
        } else if button?.tag == 4 {
            byValueBasicAnimation(setView(), view2: setView())
        } else if button?.tag == 5 {
//            moreAnimation(view1!)
            timeFun(setView())
        } else if button?.tag == 6 {
            circularMotion(setView())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
