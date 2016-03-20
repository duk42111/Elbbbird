//
//  DribbbleRequester.swift
//  Elbbbird
//
//  Created by Andyy Hope on 16/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

extension DribbbleRequester {
    typealias ShotsCompletionHandler = (shots: [Shot]) -> Void
    typealias ShotCompletionHandler = (shot: Shot?) -> Void
    typealias CommentsCompletionHandler = (comments: [Comment]) -> Void
    
    private struct Constant {
        static let accessToken = "a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21"
    }
}

class DribbbleRequester {
    
    // MARK: - Requester
    
    // Request Shots
    
    class func requestShots(completion: ShotsCompletionHandler) {
        
        let page: String = "1"
        let limit: String = "1"
        
        let url: String =
            "https://api.dribbble.com/v1/shots?" +
            "access_token=" + Constant.accessToken +
            "&page=" + page +
            "&per_page=" + limit
        
        print(url)
        
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) -> Void in
                switch response.result {
                    
                case .Success:
                    parseShots(forResponse: response, completion: completion)
                    
                case .Failure:
                    completion(shots: [])
                }
        }
    }
    
    // Request Shot
    
    class func requestShot(forShotID shotID: Int, completion: ShotCompletionHandler) {
        
        let shotID: String = String(shotID)
        let page: String = "1"
        let limit: String = "1"
        
        let url: String =
            "https://api.dribbble.com/v1/shots?" +
            "access_token=" + Constant.accessToken +
            "&page=" + page +
            "&per_page=" + limit +
            "&id=" + shotID
        
        print(url)
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) -> Void in
                switch response.result {
                    
                case .Success:
                    parseShot(forResponse: response, completion: completion)
                    
                case .Failure:
                    completion(shot: nil)
                }
        }
    }
    
    // Request Comments
    
    class func requestComments(forShotID shotID: Int, completion: CommentsCompletionHandler) {
        
        let shotID: String = String(shotID)
        
        let url: String =
            "https://api.dribbble.com/v1/" +
            "shots/" + shotID +
            "/comments?" +
            "access_token=" + Constant.accessToken

        
        print(url)
        
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) -> Void in
                switch response.result {
                    
                case .Success:
                    parseComments(forResponse: response, completion: completion)
                    
                case .Failure:
                    completion(comments: [])
                }
        }
    }
    
    
    // MARK: Parse
    
    // Parse Shots
    
    private class func parseShots(forResponse response: Response<AnyObject, NSError>, completion: ShotsCompletionHandler) {
        guard let value = response.result.value
        else {
            completion(shots: [])
            return
        }
        
        let json = JSON(value)
        
        let shots: [Shot] = json.arrayValue.map({
            Shot(json: $0)
        })
        
        shots.forEach({
            let title = $0.title ?? ""
            print(title)
        })
        
        completion(shots: shots)
    }
    
    private class func parseShot(forResponse response: Response<AnyObject, NSError>, completion: ShotCompletionHandler) {
        guard let
            value = response.result.value,
            json = JSON(value).arrayValue.first
        else {
            completion(shot: nil)
            return
        }
        
        let shot: Shot = Shot(json: json)
        
        completion(shot: shot)
    }
    
    private class func parseComments(forResponse response: Response<AnyObject, NSError>, completion: CommentsCompletionHandler) {
        guard let value = response.result.value
        else {
            completion(comments: [])
            return
        }
        
        let json = JSON(value)
        
        let comments: [Comment] = json
            .arrayValue.map({
                Comment(json: $0)
            })
            .flatMap({ $0 })
        
        completion(comments: comments)
    }
}