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


extension DribbbleRequester {
    typealias ShotsCompletionBlock = () -> Void
    
    private struct Constant {
        static let accessToken = "a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21"
    }
    
}

class DribbbleRequester {
    class func requestShots(completion: ShotsCompletionBlock) {
        
        let page: String = "1"
        let limit: String = "20"
        
        let url = "https://api.dribbble.com/v1/shots?" +
            "access_token=" + Constant.accessToken +
            "&page=" + page +
            "&per_page=" + limit
        
        print(url)
        
        Alamofire
        .request(.GET, url)
        .responseJSON { (response) -> Void in
            switch response.result {
            case .Success:
                guard let value = response.result.value else { return }
                
                let json = JSON(value)
                
                let items = json.arrayValue.map({ Shot(json: $0) })
                print(items.count)
                
                for item in items {
                    print(item.title!)
                }
                
            case .Failure:
                print("Error")
            }
        }
        
    }
}