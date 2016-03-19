//
//  ReusableViewProtocol.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}


