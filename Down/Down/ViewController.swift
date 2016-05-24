//
//  ViewController.swift
//  Down
//
//  Created by 丰雨 on 16/5/5.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

let url: String = "http://data.vod.itc.cn/?rb=1&prot=1&key=jbZhEJhlqlUN-Wj_HEI8BjaVqKNFvDrn&prod=flash&pt=1&new=/42/154/nuLVh3RpRGqzMNmX9WiWAA.mp4"
let urlM: String = "http://m8.music.126.net/20160503113101/1fad97d5df0ba9d9d1d75cc4eaa7acad/ymusic/ad72/6cdc/0e7d/8ceb131c8885dd239a83153531f0c201.mp3"

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startClick: UIButton!
    @IBOutlet weak var cleanClick: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(URLCache().f)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startAction(sender: AnyObject) {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        var reversed  = names.sort(backwards)
        reversed = names.sort({
            (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print("\(reversed)")
    }

    @IBAction func cleanAction(sender: AnyObject) {
        
    }
    
    
    
}

