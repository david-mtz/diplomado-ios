//
//  UIView+shake.swift
//  shopapp
//
//  Created by David on 8/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    
    /// Add animation shake to view
    ///
    /// - Parameters:
    ///   - count: number of times the animation is repeated
    ///   - duration: duration duration of animation
    ///   - translation: displacement size
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
    
}
