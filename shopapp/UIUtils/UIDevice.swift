//
//  UIDevice.swift
//  shopapp
//
//  Created by David on 8/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

// Get uidevice
public extension UIDevice {
    
    
    /// Get the identifier dispositive
    static let identifier: String = {
        if let vendorId = UIDevice.current.identifierForVendor {
            return "\(vendorId.uuidString)"
        } else {
            return "\(UUID().uuidString)"
        }
    }()
}
