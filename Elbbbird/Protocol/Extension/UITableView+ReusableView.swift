//
//  UITableView+Cell.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public extension UITableView {
    
    // MARK: - Register Cell Class
    
    public func register<T: UITableViewCell where T: ReusableView>(_: T.Type) {
        registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Cell Class with Nib
    
    public func register<T: UITableViewCell where T: ReusableView, T: NibLoadableView>(_: T.Type) {
        let bundle = NSBundle(forClass: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Header Footer Class
    
    public func register<T: UITableViewHeaderFooterView where T: ReusableView>(_: T.Type) {
        registerClass(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Header Footer Class with Nib
    
    public func register<T: UITableViewHeaderFooterView where T: ReusableView, T: NibLoadableView>(_: T.Type) {
        let bundle = NSBundle(forClass: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        registerNib(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    
    // MARK: - Deqeueing Cell
    
    public func dequeueReusableCell<T: UITableViewCell where T: ReusableView>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView where T: ReusableView>() -> T {
        guard let headerFooter = dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return headerFooter
    }
}
