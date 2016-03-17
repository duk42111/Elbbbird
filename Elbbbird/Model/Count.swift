//
//  Count.swift
//  Elbbbird
//
//  Created by Andyy Hope on 17/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

struct Count {
    let url: String?
    let count: Int?
    
    init?(url: String?, count: Int?) {
        guard let
            url = url,
            count = count
        else { return nil }
        
        self.url = url
        self.count = count
    }
}