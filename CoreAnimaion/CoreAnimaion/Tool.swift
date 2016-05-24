//
//  Tool.swift
//  CoreAnimaion
//
//  Created by 丰雨 on 16/5/23.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class Tool: NSObject {
    
     func arcColor() -> UIColor {
        let red: CGFloat = CGFloat(arc4random() % 255)
        let green: CGFloat = CGFloat(arc4random() % 255)
        let blue: CGFloat = CGFloat(arc4random() % 255)
        let color = UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
        return color
    }

}
