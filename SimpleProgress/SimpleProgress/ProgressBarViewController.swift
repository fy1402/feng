//
//  ProgressBarViewController.swift
//  Project_02
//
//  Created by 丰雨 on 16/5/5.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit


class ProgressBarViewController: UIViewController {
    var timer: NSTimer?
    var timeCount: Int = 10
    
    var startBtn: UIButton? = nil
    let stopBtn: UIButton? = nil
    var backView: UIView?
    
    var progressView: UIView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setProgressBarView()
        setupBtn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        timer?.invalidate()
    }
    
    func setProgressBarView() {
        backView = UIView(frame: CGRectMake(120, 50, 100, 20))
        backView!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(backView!)
        
        progressView = UIView(frame: CGRectMake(120, 50, 0, 20))
        progressView!.backgroundColor = UIColor.grayColor()
        self.view.addSubview(progressView!)
    }
    
    //runTimer
    func runTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ProgressBarViewController.tickDown), userInfo: nil, repeats: true)
    }
    
    func tickDown() {
        print("\(timeCount)")
        if timeCount <= 0 {
            startBtn!.setTitle("直线型进度条", forState: UIControlState.Normal)
            timer!.invalidate()
            return
        }
        timeCount -= 1
        let wight: CGFloat = (10 - CGFloat(timeCount)) * 10
        progressView!.frame.size.width = wight;
    }
    
    func setupBtn() {
        startBtn = UIButton(type: UIButtonType.Custom)
        startBtn!.frame = CGRectMake(10, 50, 100, 50)
        startBtn!.setTitle("直线型进度条", forState: UIControlState.Normal)
        startBtn!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        startBtn!.addTarget(self, action: #selector(ProgressBarViewController.startOrStopBtn(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(startBtn!)
    }
    
    func startOrStopBtn(button: UIButton) {
        print("---\(button.selected)")
        if button.selected {
            button.selected = false
            timer?.invalidate()
            button.setTitle("开始", forState: UIControlState.Selected)
        } else {
            button.selected = true
            runTimer()
            if timeCount >= 0 {
                button.setTitle("暂停", forState: UIControlState.Normal)
            } else {
                button.setTitle("结束", forState: UIControlState.Normal)
            }
        }
    }
    
    

}
