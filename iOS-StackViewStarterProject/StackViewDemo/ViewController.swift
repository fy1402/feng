//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Jordan Morgan on 6/10/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var horizontalStackView: UIStackView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addStarAction(sender: AnyObject) {
        let starImageVw: UIImageView = UIImageView(image: UIImage(named: "star"))
        self.horizontalStackView.addArrangedSubview(starImageVw)
        starImageVw.contentMode = .ScaleAspectFit
        UIView.animateWithDuration(0.5) { 
            self.horizontalStackView.layoutIfNeeded()
        }
    }
    
    @IBAction func removeStarAction(sender: AnyObject) {
        let star: UIView? = self.horizontalStackView.arrangedSubviews.last
        if let aStar = star {
            self.horizontalStackView.removeArrangedSubview(aStar)
            aStar.removeFromSuperview()
            UIView.animateWithDuration(0.5, animations: { 
                self.horizontalStackView.layoutIfNeeded()
            })
        }
    }
}

