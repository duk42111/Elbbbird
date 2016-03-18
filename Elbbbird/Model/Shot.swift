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

class Shot {
    let id: Int
    let title: String?
    let description: String?
    let size: CGSize
    
    let user: User?
    
    let attachments: Count?
    let comments: Count?
    let rebounds: Count?
    let likes: Count?
    let buckets: Count?
    
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
            let width = json["width"].intValue
            let height = json["height"].intValue
            return CGSize(width: width, height: height)
        }()
        
        self.comments = Count(
            url: json["comments_url"].stringValue,
            count: json["comments_count"].intValue)
        
        self.attachments = Count(
            url: json["attachments_url"].stringValue,
            count: json["attachments_count"].intValue)
        
        self.rebounds = Count(
            url: json["rebounds_url"].stringValue,
            count: json["rebounds_count"].intValue)
        
        self.likes = Count(
            url: json["likes_url"].stringValue,
            count: json["likes_count"].intValue)
        
        self.buckets = Count(
            url: json["buckets_url"].stringValue,
            count: json["buckets_count"].intValue)
        
        self.user = User(json: JSON(json["user"].dictionaryValue)) ?? nil
        
        
    }
}