//
//  URLCache.swift
//  Down
//
//  Created by 丰雨 on 16/5/5.
//  Copyright © 2016年 Feng. All rights reserved.
//

import Foundation

var urlCache: NSURLCache?

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

class URLCache: NSObject {

    
    var f  = Fahrenheit().temperature
    
    override init() {
    }
    
    func  setURLCache() {
        
    }
}
