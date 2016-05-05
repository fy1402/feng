//
//  MModel.swift
//  Project_02
//
//  Created by 丰雨 on 16/5/3.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class MModel: NSObject {
    var M_Name: String?
    var M_Address: String?
    
    init(name: String?, address: String?) {
        self.M_Name = name
        self.M_Address = address
    }
}
