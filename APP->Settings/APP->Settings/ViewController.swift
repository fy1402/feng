//
//  ViewController.swift
//  APP->Settings
//
//  Created by 丰雨 on 16/6/13.
//  Copyright © 2016年 Feng. All rights reserved.
//  "跳转系统setting"

import UIKit

class ViewController: UIViewController {

    var url: NSURL!
    
    let height: CGFloat = 60
    let width: CGFloat = 200
    let nameArr = ["prefs:root=WIFI", "prefs:root=Phone", "prefs:root=Photos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createButton()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createButton() {
        var i = 0
        
        for name in nameArr {
            i += 1
            let button = UIButton(type: .Custom)
            button.setTitle(name, forState: UIControlState.Normal)
            button.addTarget(self, action: #selector(ViewController.prefsRootSetting(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.frame = CGRectMake(80, CGFloat(i * 100), width, height)
            button.backgroundColor = UIColor.grayColor()
            view.addSubview(button)
        }
    }
    
    func prefsRootSetting(button: UIButton) {
        url = NSURL(string: (button.titleLabel?.text)!)
        UIApplication.sharedApplication().openURL(url)
    }
    

}
// MARK : 系统名称

//prefs:root=General&path=About
//prefs:root=General&path=ACCESSIBILITY
//prefs:root=AIRPLANE_MODE
//prefs:root=General&path=AUTOLOCK
//prefs:root=General&path=USAGE/CELLULAR_USAGE
//prefs:root=Brightness
//prefs:root=General&path=Bluetooth
//prefs:root=General&path=DATE_AND_TIME
//prefs:root=FACETIME
//prefs:root=General
//prefs:root=General&path=Keyboard
//prefs:root=CASTLE
//prefs:root=CASTLE&path=STORAGE_AND_BACKUP
//prefs:root=General&path=INTERNATIONAL
//prefs:root=LOCATION_SERVICES
//prefs:root=ACCOUNT_SETTINGS
//prefs:root=MUSIC
//prefs:root=MUSIC&path=EQ
//prefs:root=MUSIC&path=VolumeLimit
//prefs:root=General&path=Network
//prefs:root=NIKE_PLUS_IPOD
//prefs:root=NOTES
//prefs:root=NOTIFICATIONS_ID
//prefs:root=Phone
//prefs:root=Photos
//prefs:root=General&path=ManagedConfigurationList
//prefs:root=General&path=Reset
//prefs:root=Sounds&path=Ringtone
//prefs:root=Safari
//prefs:root=General&path=Assistant
//prefs:root=Sounds
//prefs:root=General&path=SOFTWARE_UPDATE_LINK
//prefs:root=STORE
//prefs:root=TWITTER
//prefs:root=General&path=USAGE
//prefs:root=VIDEO
//prefs:root=General&path=Network/VPN
//prefs:root=Wallpaper
//prefs:root=WIFI
//prefs:root=INTERNET_TETHERING

