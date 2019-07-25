//
//  UIImage+Url.swift
//  shopapp
//
//  Created by David on 7/20/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func getImageFromUrl(url: String, contentModeFinal: UIView.ContentMode = UIView.ContentMode.scaleAspectFit) {
        print(url)
        image = UIImage(named: "sync-spinning")
        let defaultColor = backgroundColor
        
        contentMode = .center
        backgroundColor = UIColor.clear
        
        preloadAnimation()
        
        guard let url = URL(string: url) else {
            return
        }
        
        
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    let kAnimationKey = "rotation"
                    
                    if self.layer.animation(forKey: kAnimationKey) != nil {
                        self.layer.removeAnimation(forKey: kAnimationKey)
                    }
                    self.contentMode = contentModeFinal
                    self.backgroundColor = defaultColor
                    self.image = img
                }
            }
        }
        
    }
    
    func preloadAnimation() {
        let kAnimationKey = "rotation"
        
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = 1.5
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(.pi * 2.0)
            self.layer.add(animate, forKey: kAnimationKey)
        }
        
    }
    
}
