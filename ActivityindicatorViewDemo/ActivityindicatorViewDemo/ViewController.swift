//
//  ViewController.swift
//  ActivityindicatorViewDemo
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = Tool().setColor(235, green: 85, blue: 101, alpha: 1)
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))
        let activityTypes: [ActiviytIndictorType] = [
            .BallPulse,
            .Blank]
        for i in 0 ..< activityTypes.count {
            let x = i % cols * cellWidth
            let y = i / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = ActivityindicatorView(frame: frame,
                                                                type: activityTypes[i])
            
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimation()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

