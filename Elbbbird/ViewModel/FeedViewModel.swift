//
//  FeedViewModel.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import RxSwift
import RxViewModel

class FeedViewModel : RxViewModel {
    let shots: [Shot]
    
    init(shots: [Shot]) {
        self.shots = shots
    }
}

// MARK: - Network Requests

extension FeedViewModel {
    private func requestShots() {
        DribbbleRequester.requestShots { (shots) -> Void in
            print("Hello world")
        }
    }
}