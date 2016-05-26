//
//  CountdownView.swift
//  Countdown-Demo
//
//  Created by 丰雨 on 16/5/26.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class CountdownView: UIView {

    let textfield = UITextField()
    let button = UIButton(type: UIButtonType.Custom)
    var timer = NSTimer()
    var countTime: Int = 60
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(16, 0, 100, frame.size.height)
        label.text = "验证码"
        label.textColor = UIColor.grayColor()
        label.font = UIFont.systemFontOfSize(20.0)
        self.addSubview(label)
        
//        textfield = UITextField()
        textfield.frame = CGRectMake(116, 0, frame.size.width - 240, frame.size.height)
        textfield.clearButtonMode = UITextFieldViewMode.WhileEditing
        textfield.placeholder = "请输入验证码"
        textfield.borderStyle = UITextBorderStyle.None
        self.addSubview(textfield)
        
        button.frame = CGRectMake(frame.size.width - 105, 5, 90, frame.size.height - 10)
        button.setTitle("获取验证码", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.backgroundColor = setColor(18, green: 129, blue: 201)
        button.titleLabel?.font = UIFont.systemFontOfSize(14.0)
        button.addTarget(self, action: #selector(CountdownView.getVerificationCode), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColor(red: Float, green: Float, blue: Float) -> UIColor {
        return UIColor.init(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }

    func getVerificationCode() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CountdownView.countDown), userInfo: nil, repeats: true)
        timer.fireDate = NSDate.distantPast()
        //请求服务器发送短信验证码
        //。。。。。。
    }
    
    func countDown() {
        countTime -= 1
        if countTime == 0 || countTime == 60 {
            button.userInteractionEnabled = true
            button.setTitle("获取验证码", forState: UIControlState.Normal)
        } else {
            button.userInteractionEnabled = false
            button.setTitle("\(countTime)重新获取", forState: UIControlState.Normal)
        }
    }
    
}

class myButton: NSObject {
    
    var title: String = ""
    var tintColor: UIColor = UIColor.blueColor()
    var backgroundColor = UIColor.whiteColor()
    
    init(title: String, tintColor: UIColor, backgroundColor: UIColor){
        self.title = title
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
    }
    
    
}
