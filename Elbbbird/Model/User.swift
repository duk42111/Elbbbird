//
//  User.swift
//  Elbbbird
//
//  Created by Andyy Hope on 16/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Links {
    let web: String
    let twitter: String
    
    init?(json: JSON) {

        self.web = json["web"].stringValue
        self.twitter = json["twitter"].stringValue

    }
}

struct User {

    let id: Int
    let username: String
    
    let name: String?
    let bio: String?
    let location: String?
    
    let avatarURL: String
    let htmlURL: String

    let followers: Count?
    let following: Count?
    let likes: Count?
    let projects: Count?
    let shots: Count?
    let teams: Count?
    
    init?(json: JSON) {
        self.id = json["id"].intValue
        self.username = json["username"].stringValue
        
        self.name = json["name"].stringValue
        self.bio = json["bio"].stringValue
        self.location = json["location"].stringValue
        
        self.avatarURL = json["avatar_url"].stringValue
        self.htmlURL = json["html_url"].stringValue
        
        self.followers = Count(url: json["followers_url"].stringValue,
                             count: json["followers_count"].intValue)
        
        self.following = Count(url: json["following_url"].stringValue,
                             count: json["following_count"].intValue)
        
        self.likes = Count(url: json["likes_url"].stringValue,
                         count: json["likes_count"].intValue)
        
        self.projects = Count(url: json["projects_url"].stringValue,
                            count: json["projects_count"].intValue)
        
        self.shots = Count(url: json["shots_url"].stringValue,
                         count: json["shots_count"].intValue)
        
        self.teams = Count(url: json["teams_url"].stringValue,
                         count: json["teams_count"].intValue)

    }
    
}