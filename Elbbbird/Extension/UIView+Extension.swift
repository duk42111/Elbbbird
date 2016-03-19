//
//  UIView+Extension.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setCircular() {
        set(cornerRadius: frame.width / 2)
    }
    
    func set(cornerRadius cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}