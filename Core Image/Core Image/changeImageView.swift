//
//  changeImageView.swift
//  Core Image
//
//  Created by 丰雨 on 16/6/1.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

protocol changeImageViewDelegaet: NSObjectProtocol {
    func changeStaturation(slider: UISlider)
    func changeBrightness(slider: UISlider)
    func changeContrast(slider: UISlider)
}

class changeImageView: UIView {

    let staturationSlider: UISlider? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSlider() {
        staturationSlider!.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        staturationSlider
    }

}
