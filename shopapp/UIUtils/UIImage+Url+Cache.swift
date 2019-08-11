//
//  UIImage+Url.swift
//  shopapp
//
//  Created by David on 7/20/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit


class MyImageCache {
    
    static let sharedCache: NSCache<NSString, AnyObject> = {
        let cache = NSCache<NSString, AnyObject>()
        return cache
    }()
    
}



extension UIImageView {
    
    
    /// Load image from url
    ///
    /// - Parameters:
    ///   - url: Url image
    ///   - contentModeFinal: contentModeFinal finally mode after loaded image
    func getImageFromUrl(url: String, contentModeFinal: UIView.ContentMode = UIView.ContentMode.scaleAspectFit) {
        image = UIImage(named: "sync-spinning")
        let defaultColor = backgroundColor
        contentMode = .center
        backgroundColor = UIColor.clear
        
        guard let url = URL(string: url) else {
            return
        }

        let absoluteStringUrl = url.absoluteString
        
        if let cachedImage = MyImageCache.sharedCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.contentMode = contentModeFinal
            self.backgroundColor = defaultColor
            self.image = cachedImage
            return
        }
        
        preloadAnimation()

        
            DispatchQueue.global(qos: .background).async {
                if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                    DispatchQueue.main.async {
                        let kAnimationKey = "rotation"
                        
                        if self.layer.animation(forKey: kAnimationKey) != nil {
                            self.layer.removeAnimation(forKey: kAnimationKey)
                        }
                        self.contentMode = contentModeFinal
                        self.backgroundColor = defaultColor
                        
                        // Image to cache
                        MyImageCache.sharedCache.setObject(img, forKey: url.absoluteString as NSString)
                        
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
