//
//  Shot.swift
//  Elbbbird
//
//  Created by Andyy Hope on 16/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


struct Extra {
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

struct Images {
    let highDPIURL: String
    let normalURL: String
    let teaserURL: String
    
    init(json: JSON) {
        self.highDPIURL = json["hidpi"].stringValue
        self.normalURL = json["normal"].stringValue
        self.teaserURL = json["teaser"].stringValue
    }

}

//class Dates {
//    let created: NSDate
//    let updated: NSDate
//    
//    init(json: JSON) {
//        self.created = NSDate(json[""].int64Value
//    }
//}

class Shot {
    let id: Int
    let title: String?
    let description: String?
    let size: CGSize
    
    let attachments: Extra?
    let comments: Extra?
    let rebounds: Extra?
    let likes: Extra?
    let buckets: Extra?
    
    let images: Images
    
    let tags: Set<String>
    
    init(json: JSON) {
        self.id = json["id"].intValue
        
        self.title = json["title"].stringValue
        
        self.description = json["description"].stringValue
        
        self.tags = Set(json["tags"].arrayValue
            .map({ $0.stringValue }))
        
        self.images = Images(json: json)
        
        self.size = {
            let width: Float = json["width"].floatValue ?? 0
            let height: Float = json["height"].floatValue ?? 0
            return CGSize(width: CGFloat(width), height: CGFloat(height))
        }()
        
        self.comments = Extra(url: json["comments_url"].stringValue,
                            count: json["comments_count"].intValue)
        
        self.attachments = Extra(url: json["attachments_url"].stringValue,
                               count: json["attachments_count"].intValue)
        
        self.rebounds = Extra(url: json["rebounds_url"].stringValue,
                            count: json["rebounds_count"].intValue)
        
        self.likes = Extra(url: json["likes_url"].stringValue,
                         count: json["likes_count"].intValue)
        
        self.buckets = Extra(url: json["buckets_url"].stringValue,
                           count: json["buckets_count"].intValue)
    }
}