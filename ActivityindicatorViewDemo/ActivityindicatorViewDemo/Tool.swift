//
//  Tool.swift
//  ActivityindicatorViewDemo
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class Tool: NSObject {
    
    func setColor(red: Float, green: Float, blue: Float, alpha: Float) -> UIColor {
        return UIColor.init(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
