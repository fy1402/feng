//
//  QrCodeViewController.swift
//  QrCode_Swift
//
//  Created by 丰雨 on 16/5/31.
//  Copyright © 2016年 Feng. All rights reserved.
//  Create QRCode

import UIKit
import Foundation
import AVFoundation

class QrCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let qrCode = QRCodeModel()
        //无图二维码
        qrCode.createQRCode("www.baidu.com")
        //有图二维码
        qrCode.createQRCodeImage("www.baidu.com", image: "icon")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
