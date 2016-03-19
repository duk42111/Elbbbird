//
//  TableViewPresenting.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import UIKit


protocol ReusableRegistering {
    
    // Need to figure out how to put generics as extension variables isntead of funcs. Is it even possible?
    func reusableViews<T>() -> [T]
    
    func registerReusableViews()
}

extension ReusableRegistering  {
    
    func registerReusableViews() {
        
    }
}