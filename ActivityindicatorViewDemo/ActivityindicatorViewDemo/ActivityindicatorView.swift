//
//  ActivityindicatorView.swift
//  ActivityindicatorViewDemo
//
//  Created by 丰雨 on 16/5/27.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

public enum ActiviytIndictorType: Int {
    /**
     BallPulse.
     
     - returns: Instance of NVActivityIndicatorAnimationBallPulse.
     */
    case BallPulse
    /**
     Blank.
     
     - returns: Instance of NVActivityIndicatorAnimationBlank.
     */
    case Blank
    
    private static let allTypes = (BallPulse.rawValue ... Blank.rawValue).map{
        ActiviytIndictorType(rawValue: $0)!
    }
    
    private func animation() -> ActivityindicatorVAnimationDelegate {
        switch self {
        case .BallPulse:
            return Animation_BallPulse()
        case .Blank:
            return Animation_Blank()
        }
    }
}

public class ActivityindicatorView: UIView {
    private static let DEFAULT_TYPE: ActiviytIndictorType = .BallPulse
    private static let DEFAULT_COLOR = UIColor.whiteColor()
    private static let DEFAULT_PADDING: CGFloat = 0
    
    public var type: ActiviytIndictorType = DEFAULT_TYPE
    @available(*, unavailable, message="This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var typeName: String {
        get {
            return String(self.type)
        }
        set (typeString) {
            for item in ActiviytIndictorType.allTypes {
                if String(item).caseInsensitiveCompare(typeString) == NSComparisonResult.OrderedSame {
                    self.type = item
                    break
                }
            }
        }
    }
    
    /// Color of activity indicator view.
    @IBInspectable public var color: UIColor = ActivityindicatorView.DEFAULT_COLOR
    /// Padding of activity indicator view.
    @IBInspectable public var padding: CGFloat = ActivityindicatorView.DEFAULT_PADDING
    
    /// Current status of animation, this is not used to start or stop animation.
    public var animating: Bool = false
    
    /// Specify whether activity indicator view should hide once stopped.
    @IBInspectable public var hidesWhenStopped: Bool = true
    
    /**
     Create a activity indicator view with default type, color and padding.\n
     This is used by storyboard to initiate the view.
     
     - Default type is pacman.\n
     - Default color is white.\n
     - Default padding is 0.
     
     - parameter decoder:
     
     - returns: The activity indicator view.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.backgroundColor = UIColor.clearColor()
    }
    
    /**
     Create a activity indicator view with specified frame, type, color and padding.
     
     - parameter frame: view's frame setting the actual size of animation.
     - parameter type: animation type, value of NVActivityIndicatorType enum. Default type is pacman.
     - parameter color: color of activity indicator view. Default color is white.
     - parameter padding: padding of animation in frame. Default padding is 0.
     
     - returns: The activity indicator view.
     */
    public init(frame: CGRect, type: ActiviytIndictorType = DEFAULT_TYPE, color: UIColor = DEFAULT_COLOR, padding: CGFloat = DEFAULT_PADDING) {
        self.type = type
        self.color = color
        self.padding = padding
        super.init(frame: frame)
    }
    
    /**
     Start animation.
     */
    public func startAnimation() {
        if hidesWhenStopped && hidden {
            hidden = false
        }
        if (self.layer.sublayers == nil) {
            setUpAnimation()
        }
        self.layer.speed = 1
        self.animating = true
    }
    
    /**
     Stop animation.
     */
    public func stopAnimation() {
        self.layer.sublayers = nil
        self.animating = false
        if hidesWhenStopped && !hidden {
            hidden = true
        }
    }
    
    // MARK: Privates
    
    private func setUpAnimation() {
        let animation: protocol<ActivityindicatorVAnimationDelegate> = self.type.animation()
        
        self.layer.sublayers = nil
        
        let paddedRect = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(padding, padding, padding, padding))
        animation.setupAnimationInLayer(self.layer, size: paddedRect.size, color: self.color)
    }
}
