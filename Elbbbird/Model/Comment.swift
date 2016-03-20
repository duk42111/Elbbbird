//
//  Comment.swift
//  Elbbbird
//
//  Created by Andyy Hope on 20/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Comment {
    let commentID: Int
    let body: String
    let user: User
    let likes: Count
    
    init?(json: JSON) {
        
        guard let
            commentID = json["id"].int,
            body = json["body"].string,
            user = User(json: json["user"]),
            likes = Count(url: json["likes_url"].string, count: json["likes_count"].int)
        else { return nil }
        
        self.commentID = commentID
        self.body = body
        self.user = user
        self.likes = likes
    }
}