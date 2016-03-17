//
//  Dates.swift
//  Elbbbird
//
//  Created by Andyy Hope on 17/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

class Dates {
    let created: String
    let updated: String
    
    init(json: JSON) {
        self.created = json["created_at"].stringValue
        self.updated = json["updated_at"].stringValue
    }
}
