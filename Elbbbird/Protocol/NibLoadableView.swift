//
//  NibLoadableView.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {

        guard let nibName = NSStringFromClass(self).componentsSeparatedByString(".").last else {
            fatalError("Could not load nib with name: \(NSStringFromClass(self))")
        }
        
        return nibName
    }
}