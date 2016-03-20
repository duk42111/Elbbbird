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
    typealias ShotsCompletionBlock = (shots: [Shot]) -> Void
    
    private struct Constant {
        static let accessToken = "a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21"
    }
    
}

class DribbbleRequester {
    
    // MARK: - Requester
    
    class func requestShots(completion: ShotsCompletionBlock) {
        
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
    
    // MARK: Parse
    
    private class func parseShots(forResponse response: Response<AnyObject, NSError>, completion: ShotsCompletionBlock) {
        guard let value = response.result.value else {
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
}