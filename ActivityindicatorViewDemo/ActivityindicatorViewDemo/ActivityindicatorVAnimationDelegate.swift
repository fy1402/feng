//
//  ActivityindicatorVAnimationDelegate.swift
//  ActivityindicatorViewDemo
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

protocol ActivityindicatorVAnimationDelegate: NSObjectProtocol {
    func setupAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor)
}
