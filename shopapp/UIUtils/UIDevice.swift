//
//  UIDevice.swift
//  shopapp
//
//  Created by David on 8/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    static let identifier: String = {
        if let vendorId = UIDevice.current.identifierForVendor {
            return "\(vendorId.uuidString)"
        } else {
            return "\(UUID().uuidString)"
        }
    }()
}
