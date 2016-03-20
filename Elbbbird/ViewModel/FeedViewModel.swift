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
    
    func viewModelForHeadingCell(atIndexPath indexPath: NSIndexPath) -> FeedViewHeadingCellViewModel {
        let viewModel = FeedViewHeadingCellViewModel(shot: shots[indexPath.section])
        return viewModel
    }
}

struct FeedViewHeadingCellViewModel {
    let shot: Shot
    let username: String!
    let location: String!
    let date: String!
    let image: UIImage!
    
    init(shot: Shot, username: String = "", location: String = "", date: String = "", image: UIImage = UIImage()) {
        
        self.shot = shot
        self.username = shot.user?.username ?? username
        self.location = shot.user?.location ?? location
        self.date = date
        self.image = image
    }
}