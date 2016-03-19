//
//  FeedViewModel.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import RxSwift

struct FeedViewModel {
    let shots: Observable<[Shot]>
    
    let title = "Popular Shots"
    
//    var isRequestingNetwork: Bool = true
}

// MARK: - Network Requests

extension FeedViewModel {
    private func requestShots() {
        DribbbleRequester.requestShots { (shots) -> Void in
            print("Hello world")
        }
    }
}