//
//  ViewController.swift
//  SMS_Swift
//
//  Created by 丰雨 on 16/6/3.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .Custom)
        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("短信", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(ViewController.getSMSCode), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
    }
    
    func getSMSCode() {
        /**
         *  @from                    v1.1.1
         *  @brief                   获取验证码(Get verification code)
         *
         *  @param method            获取验证码的方法(The method of getting verificationCode)
         *  @param phoneNumber       电话号码(The phone number)
         *  @param zone              区域号，不要加"+"号(Area code)
         *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
         *  @param result            请求结果回调(Results of the request)
         */
        SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethodSMS,
                                           phoneNumber: "13703075290",
                                           zone: "86",
                                           customIdentifier: nil) {
                                            (error) in
                                            if (error == nil) {
                                                print("获取验证码")
                                            } else {
                                                print("错误信息:\(error)")
                                            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

